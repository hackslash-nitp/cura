import 'package:cura/individual/home_page_individual.dart';
import 'package:cura/shared/widgets/widgets.dart';
import 'package:cura/startup_screens/create_account.dart';
import 'package:cura/startup_screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../navigation.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool otpEntered = false;
  String? _otp;

  //Function to get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  //Function to login user using email and password
  Future<String?> loginUserWithEmail(String email, String password, BuildContext context) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Navigation.navigateToPageWithReplacement(context, HomePageIndividual.routeName));
    } on FirebaseAuthException catch (e) {
      CustomErrorDialog.showErrorDialog(context, e.message!);
      return null;
    }
    return _auth.currentUser!.uid;
  }

  //Function to login user with phone number
  Future<void> loginUserWithPhoneNumber(String phoneNumber, BuildContext context, bool isSignUp) async {
    try {
      await _auth.verifyPhoneNumber(
          timeout: const Duration(seconds: 60),
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential cred) async {
            _otp = cred.smsCode;
            Otp otp = Otp(otp: _otp ?? "");
            otp.setOtp();

            if (cred.smsCode != null) {
              try {
                await _auth.signInWithCredential(cred).then((value) => isSignUp
                    ? Navigation.navigateToPageWithReplacement(context, HomePageIndividual.routeName)
                    : Navigation.navigateToPageWithReplacement(context, CreateAccountPage.routeName));
              } on FirebaseAuthException catch (e) {
                CustomErrorDialog.showErrorDialog(context, e.message!);
              }
            }
          },
          verificationFailed: (FirebaseAuthException e) {
            CustomErrorDialog.showErrorDialog(context, e.message!);
          },
          codeSent: (String verificationId, int? forceResendingToken) async {},
          codeAutoRetrievalTimeout: (String verificationID) {});
    } on FirebaseAuthException catch (e) {
      CustomErrorDialog.showErrorDialog(context, e.message!);
    }
  }

  //Function to sign-up user
  Future<void> signupUser(String email, String password, BuildContext context) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Navigation.navigateToPageWithReplacement(context, CreateAccountPage.routeName));
    } on FirebaseAuthException catch (e) {
      CustomErrorDialog.showErrorDialog(context, e.message!);
    }
  }

  //Function to logout user
  Future<void> logoutUser(BuildContext context) async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      CustomErrorDialog.showErrorDialog(context, e.message!);
    }
  }
}
