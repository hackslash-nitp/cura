import 'package:cura/startup_screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool otpEntered = false;

  //Function to get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  //Function to login user using email and password
  Future<String?> loginUserWithEmail(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      navigateToHome(context);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      showErrorDialog(context, e.message!);
      return null;
    }
    return _auth.currentUser!.uid;
  }

  //Function to login user with phone number
  Future<String?> loginUserWithPhoneNumber(
      String phoneNumber, BuildContext context) async {
    try {
      await _auth.verifyPhoneNumber(
          timeout: const Duration(seconds: 60),
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential cred) async {
            print("Verification Completed: ${cred.smsCode}");
            setOtp(cred.smsCode!);
            User? currentUser = getCurrentUser();
            if (cred.smsCode != null) {
              try {
                await _auth
                    .signInWithCredential(cred)
                    .then((value) => navigateToHome(context));
                navigateToHome(context);
              } on FirebaseAuthException catch (e) {
                showErrorDialog(context, e.message!);
              }
            }
          },
          verificationFailed: (FirebaseAuthException e) {
            print(e.message);
            showErrorDialog(context, e.message!);
          },
          codeSent: (String verificationId, int? forceResendingToken) async {},
          codeAutoRetrievalTimeout: (String verificationID) {});
    } on FirebaseAuthException catch (e) {
      print(e.message);
      showErrorDialog(context, e.message!);
    }
  }

  //Function to sign-up user
  Future<void> signupUser(
      String email, String password, BuildContext context) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await loginUserWithEmail(email, password, context);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      showErrorDialog(context, e.message!);
    }
  }

  //Function to logout user
  Future<void> logoutUser(BuildContext context) async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      print(e.message);
      showErrorDialog(context, e.message!);
    }
  }
}
