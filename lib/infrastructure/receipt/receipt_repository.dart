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

  @override
  Stream<Either<ReceiptFailure, List<Receipt>>> watchFavorite() {
    // TODO: implement watchFavorite
    throw UnimplementedError();
  }

  @override
  Future<Either<ReceiptFailure, Unit>> create(Receipt note) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<ReceiptFailure, Unit>> delete(Receipt note) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<ReceiptFailure, Unit>> update(Receipt note) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
