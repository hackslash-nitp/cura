import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cura/shared/services/firebase_authentication.dart';

class FirestoreDatabase {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuthentication _auth = FirebaseAuthentication();

  Future<void> postReview(int rating, String review) async {
    final Map<String, dynamic> userReview = {
      'rating': rating,
      'review': review
    };
    await _db.collection('reviews').doc().set(userReview);
  }

  Future<void> postIndividualProfileData(
      Map<String, dynamic> profileData) async {
    String? uid;
    final currentUser = _auth.getCurrentUser();
    if (currentUser == null) {
      print("User is not logged in!");
    }
    uid = currentUser!.uid;
    await _db
        .collection('users')
        .doc('individualUsers')
        .collection('profileData')
        .doc(uid)
        .set(profileData);
  }

  Future<void> postOrganizationProfileData(
      Map<String, dynamic> profileData) async {
    String? uid;
    final currentUser = _auth.getCurrentUser();
    if (currentUser == null) {
      print("User is not logged in!");
    }
    uid = currentUser!.uid;
    await _db
        .collection('users')
        .doc('organisationUsers')
        .collection('profileData')
        .doc(uid)
        .set(profileData);
  }
}
