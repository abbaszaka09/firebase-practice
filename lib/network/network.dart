import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:registration_firebase/models/user.dart';

class Network {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
   final FirebaseStorage storage = FirebaseStorage.instance;

  Future<MyUser> loginUser(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      final snapshot = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();
      if (snapshot.exists) {
        final data = snapshot.data();
        final myUserModel = MyUser.fromJson(data!);
        return myUserModel;
      } else {
        throw 'error';
      }
    } on FirebaseException catch (e) {
      throw (e.toString());
    }
  }

  Future<MyUser> RegisterUser(
      {required MyUser user, required String password}) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: user.email, password: password);

      MyUser myUserModel = MyUser(
          uid: userCredential.user!.uid, name: user.name, email: user.email,image: '');
      await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(myUserModel.toJson());

      return myUserModel;
    } on FirebaseException catch (e) {
      throw (e.toString());
    }
  }

  Future<String> uploadImage(
      {required File image}) async {
    final storageReference =
        storage.ref("Images").child('user');

    TaskSnapshot uploadTask = await storageReference.putFile(image);
    final String url = await uploadTask.ref.getDownloadURL();

    print(url);

    return url;
  }
}
