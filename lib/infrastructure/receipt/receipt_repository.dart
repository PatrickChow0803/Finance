import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:finance/domain/receipt/i_receipt_repository.dart';
import 'package:finance/domain/receipt/receipt.dart';
import 'package:finance/domain/receipt/receipt_failure.dart';
import 'package:injectable/injectable.dart';
import 'package:finance/infrastructure/core/firebase_helpers.dart';

@LazySingleton(as: IReceiptRepository)
class ReceiptRepository implements IReceiptRepository {
  final FirebaseFirestore _firestore;

  ReceiptRepository(this._firestore);

  // Getting to the receipts collection is users/{userId}/receipts
  // async* here because return type is a Stream, not a Future
  @override
  Stream<Either<ReceiptFailure, List<Receipt>>> watchAll() async* {
    // need to manually import extension method from firestore_helpers
    // this is equal to users/{userId}/
    final userDoc = await _firestore.userDocument();

    yield* userDoc.receiptCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map((snapshot) => right<ReceiptFailure, List<Receipt>>(snapshot.docs
            .map((doc) => Receipt(
                  id: doc.id,
                  category: doc['category'] as Category,
                  price: 1,
                  date: DateTime.now(),
                  isFavorite: false,
                ))
            .toList()));
  }

  // display only favorited receipts
  @override
  Stream<Either<ReceiptFailure, List<Receipt>>> watchFavorite() async* {
    // final userDoc = await _firestore.userDocument();
    // yield* userDoc.receiptCollection.orderBy('serverTimeStamp', descending: true).snapshots().map(
    //       (snapshot) => right<ReceiptFailure, List<Receipt>>(
    //         snapshot.docs.map((receipts) => ,
    //       ),
    //     );
  }

  @override
  Future<Either<ReceiptFailure, Unit>> create(Receipt receipt) async {
    try {
      final userDoc = await _firestore.userDocument();

      // use .set instead of .add here because if we were to use .add,
      // Firebase would automatically generate an ID for the document.
      // But we're already generating an ID in the app, so therefore use the .set property
      // if no document exists, firebase creates the new document automatically.
      // if the document does exists, just update the values
      // since .set is an async operation, use await here
      await userDoc.receiptCollection
          .doc(receipt.id)
          .set({'price': receipt.price, 'date': receipt.date});

      // if nothing went wrong, return right(unit)
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const ReceiptFailure.insufficientPermission());
      } else {
        return left(const ReceiptFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<ReceiptFailure, Unit>> delete(Receipt receipt) async {
    try {
      final userDoc = await _firestore.userDocument();

      await userDoc.receiptCollection.doc(receipt.id).delete();

      // if nothing went wrong, return right(unit)
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const ReceiptFailure.insufficientPermission());
      } else if (e.message.contains('NOT_FOUND')) {
        return left(const ReceiptFailure.unableToUpdate());
      } else {
        return left(const ReceiptFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<ReceiptFailure, Unit>> update(Receipt receipt) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
