import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_firebase/providers/auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _passController = TextEditingController();
  final _emailController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Registration',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: _key,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'Enter your Full Name',
                          label: const Text('full name'),
                          labelStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.red,
                                style: BorderStyle.solid,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          label: const Text('email'),
                          labelStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.red,
                                style: BorderStyle.solid,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      TextFormField(
                        controller: _passController,
                        decoration: InputDecoration(
                          hintText: 'password',
                          label: const Text('password'),
                          labelStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.red,
                                style: BorderStyle.solid,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CupertinoButton(
                child: const Text('Register'),
                onPressed: () {
                  Provider.of<AuthProvider>(context, listen: false)
                      .signUpWithEmailPass(context,
                          name: _nameController.text,
                          email: _emailController.text,
                          password: _passController.text);
                },
                color: Colors.blue,
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  ' Already have an account? LOGIN',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
