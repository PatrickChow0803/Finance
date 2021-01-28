import 'package:finance/domain/auth/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

extension FirebaseUserDomainX on User {
  UniqueUser toDomain() {
    return UniqueUser(
      // uid comes from this object
      id: Uuid().v1(), email: this.email, displayName: this.displayName,
    );
  }
}
