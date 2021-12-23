import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:registration_firebase/models/user.dart';
import 'package:registration_firebase/network/network.dart';
import 'package:registration_firebase/routs/routs.dart';
import 'package:path/path.dart';

class AuthProvider with ChangeNotifier {
  File? selectedFile;
  final network = Network();
  MyUser? myUserModel;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // void changeImage(File file) {
  //   selectedFile = file;
  //   notifyListeners();
  // }

  void checkCurrentUSer(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      if (_auth.currentUser == null) {
        Navigator.pushNamed(context, Routs.loginScreen);
      } else {
        
        Navigator.pushNamed(context, Routs.homeScreen);
      }
    });
  }

  Future<void> signUpWithEmailPass(
    BuildContext context, {
    required String name,
    required String email,
    required String password,
  }) async {
    MyUser user = MyUser(uid: '', name: name, email: email, image: '');
    user = await network.RegisterUser(user: user, password: password);
    myUserModel = user;
    checkCurrentUSer(context);
  }

  Future<void> loginUser(BuildContext context,
      {required String email, required String password}) async {
    final user = await network.loginUser(email: email, password: password);
    myUserModel = user;
    Navigator.pushNamedAndRemoveUntil(
        context, Routs.homeScreen, (route) => false);
  }

  Future<void> uploadImage(BuildContext context, File file) async {
    String fileName = basename(file.path);
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('uploads/${_auth.currentUser!.uid}/$fileName');
    final snap = await storageRef.putFile(file);
    final imageUrl = await snap.ref.getDownloadURL();

    myUserModel!.image = imageUrl.toString();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .set(myUserModel!.toJson());

    notifyListeners();
  }
}
