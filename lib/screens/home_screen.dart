import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:registration_firebase/commons/picker_dailogue.dart';
import 'package:registration_firebase/providers/auth_provider.dart';
import 'package:registration_firebase/routs/routs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                Provider.of<AuthProvider>(context, listen: false)
                    .uploadImage(context, file!);
                final ImageSource? source =
                    await Utils.imagePickOptions(context);
                if (source != null) {
                  final pickedImage =
                      await ImagePicker().pickImage(source: source);
                  if (pickedImage != null) {
                    setState(() {
                      file = File(pickedImage.path);
                    });
                  }
                }
              },
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 100,
                backgroundImage: file != null ? FileImage(file!) : null,
                child: file == null
                    ? const Icon(
                        Icons.camera_alt,
                        size: 30,
                      )
                    : const SizedBox(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Home Screen',
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, Routs.loginScreen);
                },
                child: const Text(
                  ' Go to Login',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
