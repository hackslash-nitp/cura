import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Function to get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  //Function to login user using email and password
  Future<String?> loginUserWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException {
      print("Error occured while logging in via email.");
    }
    return _auth.currentUser!.uid;
  }

  //Function to login user with phone number
  Future<String?> loginUserWithPhoneNumber(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
          timeout: const Duration(seconds: 60),
          phoneNumber: '+91$phoneNumber',
          verificationCompleted: (PhoneAuthCredential cred) async {
            await _auth.signInWithCredential(cred);
          },
          verificationFailed: (FirebaseAuthException e) {
            print(
                "Verification of phone number failed"); //Dummy code for error handling for now
          },
          codeSent: (String verificationId, int? forceResendingToken) async {
            String smsCode = "xxxx";
            PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: verificationId, smsCode: smsCode);
            await _auth.signInWithCredential(credential);
          },
          codeAutoRetrievalTimeout: (String verificationID) {});
    } on FirebaseAuthException {
      print("Error occured while logging in via phone");
    }
    return _auth.currentUser!.uid;
  }

  //Function to sign-up user
  Future<void> signupUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException {
      print("Error occured while registering user");
    }
  }

  //Function to logout user
  Future<void> logoutUser() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException {
      print("Error occured while logging out");
    }
  }
}
