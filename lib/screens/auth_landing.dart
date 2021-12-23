import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_firebase/providers/auth_provider.dart';

class AuthLanding extends StatefulWidget {
  const AuthLanding({Key? key}) : super(key: key);

  @override
  State<AuthLanding> createState() => _AuthLandingState();
}

class _AuthLandingState extends State<AuthLanding> {


  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<AuthProvider>(context, listen: false)
          .checkCurrentUSer(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Splashing',
            ),
          ],
        ),
      ),
    );
  }
}
