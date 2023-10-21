import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cura/shared/services/firebase_authentication.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class Storage {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> postFile(File file, String name) async {
    UploadTask? uploadTask;
    final String path = name;
    final ref = _storage.ref().child(path);
    uploadTask = ref.putFile(file);
    final snapshot = await uploadTask.whenComplete(() {
      print("Uploaded successfully!");
    });
    final url = await snapshot.ref.getDownloadURL();
    return url;
  }
}

class FirestoreDatabase {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuthentication _auth = FirebaseAuthentication();

  Future<void> postReview(int rating, String review) async {
    final Map<String, dynamic> userReview = {
      'rating': rating,
      'review': review,
    };
    await _db.collection('reviews').doc().set(userReview);
  }

//
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

  //
//
  Future<Map> getIndividualProfileData(String id) async {
    DocumentReference user = _db
        .collection("users")
        .doc("individualUsers")
        .collection("profileData")
        .doc(id);
    DocumentSnapshot userData = await user.get();
    return userData.data() as Map;
  }

//
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

  Future<List> getOrganisationProfileData() async {
    final orgUsers = _db
        .collection("users")
        .doc("organisationUsers")
        .collection("profileData");
    QuerySnapshot snap = await orgUsers.get();
    List allData = snap.docs;
    List orgProfiles = [];
    for (var d in allData) {
      orgProfiles.add(d.data());
    }
    return orgProfiles;
  }

  Future<void> postVolunteerData(Map<String, dynamic> volunteerData) async {
    await _db
        .collection("users")
        .doc("individualUsers")
        .collection("volunteerDetails")
        .doc()
        .set(volunteerData);
  }

  Future<void> addPost(List<File> images, String postText) async {
    try {
      final currentUserUid = _auth.getCurrentUser()!.uid;
      Map data = await getIndividualProfileData(currentUserUid);
      List<String> imagesUrl = [];
      for (final imgFile in images) {
        imagesUrl.add(await Storage().postFile(imgFile,
            'postImages/${data['individualEmail']}${imgFile.hashCode}'));
      }

      Map<String, dynamic> postData = {
        'userImgUrl': data['imgUrl'],
        'name': data['individualName'],
        'uid': currentUserUid,
        'imagesUrl': imagesUrl,
        'createdOn': DateTime.now().toString(),
        'postText': postText,
      };

      await _db.collection('posts/').add(postData);
    } catch (e) {
      print(e);
      return;
    }
  }

  Stream getPostData() {
    return _db.collection('posts/').snapshots();
  }

  Future<void> spendtime(Map<String, dynamic> spendData) async {
    String? uid;
    final currentUser = _auth.getCurrentUser();
    if (currentUser == null) {
      print("User is not logged in!");
    }
    uid = currentUser!.uid;
    await _db
        .collection('spend')
        .doc('individualUsers')
        .collection('spendData')
        .doc(uid)
        .set(spendData);
  }
}