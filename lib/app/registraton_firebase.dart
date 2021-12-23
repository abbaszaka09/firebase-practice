import 'package:flutter/material.dart';
import 'package:registration_firebase/routs/routs.dart';

class RegistrationFirebase extends StatelessWidget {
  const RegistrationFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routs.authLanding,
      routes: Routs.appRoutes,
    );
  }
}
