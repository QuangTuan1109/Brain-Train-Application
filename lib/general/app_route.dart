import 'package:flutter_application_1/screens/game/math/Game_Math1_Screen.dart';
import 'package:flutter_application_1/screens/Signin_Screen.dart';
import 'package:flutter_application_1/screens/Signup_Screen.dart';
import 'package:flutter_application_1/screens/game/math/Game_Math2_Screen.dart';
import 'package:flutter_application_1/screens/game/math/Math_Screen.dart';
import 'package:flutter_application_1/screens/home/homepage.dart';
import 'package:flutter_application_1/screens/setting/Setting_Screen.dart';

class RouteGenerator {
  const RouteGenerator._();

  static const signin = '/signin';
  static const signup = '/signup';
  static const homepage = '/homepage';
  static const setting = '/setting';
  static const mathScreen = '/mathScreen';
  static const gameMath1 = '/gameMath1';
  static const gameMath2 = '/gameMath2';

  static final routes = {
    signin: (context) => const SigninScreen(),
    signup: (context) => const SignupScreen(),
    homepage: (context) => const Homepage(),
    setting: (context) => const SettingsScreen(),
    mathScreen: (context) => const MathScreen(),
    gameMath1: (context) => const GameMath1Screen(),
    gameMath2: (context) => const GameMath2Screen(),
  };
}
