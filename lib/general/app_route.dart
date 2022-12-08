import 'package:flutter_application_1/screens/Game_Math1_Screen.dart';
import 'package:flutter_application_1/screens/Signin_Screen.dart';
import 'package:flutter_application_1/screens/Signup_Screen.dart';
import 'package:flutter_application_1/screens/game/math/Math_Screen.dart';
import 'package:flutter_application_1/screens/home/homepage.dart';

class RouteGenerator {
  const RouteGenerator._();

  static const signin = '/signin';
  static const signup = '/signup';
  static const homepage = '/homepage';
  static const mathScreen = '/mathScreen';
  static const gameMath1 = '/gameMath1';

  static final routes = {
    signin: (context) => const SigninScreen(),
    signup: (context) => const SignupScreen(),
    homepage: (context) => const Homepage(),
    mathScreen: (context) => const MathScreen(),
    gameMath1: (context) => const GameMath1Screen(),
  };
}
