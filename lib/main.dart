import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_firebase/app/registraton_firebase.dart';
import 'package:registration_firebase/providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
        create: (context) => AuthProvider(),
        child: const RegistrationFirebase()),
  );
}
