import 'package:app/users/domain/homeowner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AuthenticationRepository {
  Stream<Homeowner?> authStateChanges();
  void signIn(String phoneNumber);
  Future<void> signOut();
  Future<bool> verifyOTP(String verificationId, String otp);
  Future<Homeowner?> getCurrentUser();
}

class FirebaseAuthenticationRepository extends AuthenticationRepository {
  @override
  Stream<Homeowner?> authStateChanges() async* {
    yield await getCurrentUser();
  }

  // Returns null when credentials are invalid
  @override
  void signIn(String phoneNumber) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {}
        },
        codeSent: (String verificationId, int? resendToken) async {
          verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'wrong-password':
          return null;
        case 'user-not-found':
          return null;
        case 'user-disabled':
          return null;
        case 'invalid-email':
          return null;
        default:
          throw Exception('Unknown error occured.');
      }
    }
  }

  @override
  Future<bool> verifyOTP(String verificationId, String otp) async {
    var credentials = await FirebaseAuth.instance.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: otp));
    return credentials.user != null ? true : false;
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

final verificationId = Provider<String>((ref) {
  return '';
});
