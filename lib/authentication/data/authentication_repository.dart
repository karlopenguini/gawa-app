import 'package:app/users/domain/homeowner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

abstract class AuthenticationRepository {
  Stream<Homeowner?> authStateChanges();
  Future<void> signOut();
  Future<Homeowner?> getCurrentUser();
}

class FirebaseAuthenticationRepository extends AuthenticationRepository {
  @override
  Stream<Homeowner?> authStateChanges() async* {
    yield await getCurrentUser();
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<Homeowner?> getCurrentUser() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) {
      return null;
    }
    return FirebaseFirestore.instance
        .collection("individuals")
        .where('userId', isEqualTo: firebaseUser.uid)
        .get()
        .then((value) => value.docs.first.data())
        .then((value) => Homeowner.fromJson(value));
  }
}

final authenticationRepositoryProvider = Provider<AuthenticationRepository>(
  (ref) {
    return FirebaseAuthenticationRepository();
  },
);

final verificationId = Provider<String>((ref) => "");
