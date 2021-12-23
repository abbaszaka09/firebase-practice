
import 'package:registration_firebase/screens/auth_landing.dart';
import 'package:registration_firebase/screens/home_screen.dart';
import 'package:registration_firebase/screens/login_screen.dart';
import 'package:registration_firebase/screens/register_screen.dart';

class Routs{
  
  static const loginScreen = "/loginScreen";
  static const registerScreen = "/register";
  static const homeScreen = "/homeScreen";
  static const authLanding = "/authLanding";

   static final appRoutes = {
   authLanding: (context) => AuthLanding(),
    loginScreen:(context)=>LoginScreen(),
    registerScreen: (context) => RegisterScreen(),
    homeScreen: (context) => HomeScreen(),
  };
}