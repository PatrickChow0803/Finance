import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance/domain/auth/i_auth_facade.dart';
import 'package:finance/domain/core/errors.dart';
import 'package:finance/injection.dart';

// File contains extension methods for Firestore related code

// true path to get receipts is: users/{userId}/receipts/{receiptsId}

// userDocument gives users/{userId}/
extension FirestoreX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = await getIt<IAuthFacade>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    return FirebaseFirestore.instance.collection('users').doc(user.id);
  }
}

extension DocumentReferenceX on DocumentReference {
  // this is the same as just doing users('usersId').collection('receipts')
  CollectionReference get receiptCollection => collection('receipts');
}
