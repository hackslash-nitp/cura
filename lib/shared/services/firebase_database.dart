import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabase {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> postReview(int rating, String review) async {
    final Map<String, dynamic> userReview = {
      'rating': rating,
      'review': review
    };
    await _db.collection('reviews').doc().set(userReview);
  }
}

class UserFirestoreDatabase extends FirestoreDatabase {}

class OrgFirestoreDatabase extends FirestoreDatabase {}
