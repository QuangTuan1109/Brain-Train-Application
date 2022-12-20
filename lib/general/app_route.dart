import 'package:flutter_application_1/screens/Game_Math1_Screen.dart';
import 'package:flutter_application_1/screens/Signin_Screen.dart';
import 'package:flutter_application_1/screens/Signup_Screen.dart';
import 'package:flutter_application_1/screens/game/math/Math_Screen.dart';
import 'package:flutter_application_1/screens/home/homepage.dart';
//Languages Game
import 'package:flutter_application_1/screens/game/languages/Language_Screen.dart';
import 'package:flutter_application_1/screens/game/languages/languaes_first_letter.dart';
import 'package:flutter_application_1/screens/game/languages/languages_conjunction.dart';
import 'package:flutter_application_1/screens/game/languages/languages_first_word.dart';
import 'package:flutter_application_1/screens/game/languages/languages_word_sort.dart';

//Admin

import 'package:flutter_application_1/screens/admin/admin_page.dart';

//popup

class RouteGenerator {
  const RouteGenerator._();

  static const signin = '/signin';
  static const signup = '/signup';
  static const homepage = '/homepage';
  static const mathScreen = '/mathScreen';
  static const gameMath1 = '/gameMath1';

  //Languages Game
  static const languageScreen = '/languageScreen';
  static const gameLetter = '/gameLetter';
  static const gameWord = '/gameWord';
  static const gameConj = '/gameConj';
  static const gameSort = '/gameSort';

  //popup
  static const walkthrough_screen = '/walkthrough_screen';
  //admin_page

  static const admin_page2 = '/admin_page2';

  static final routes = {
    signin: (context) => const SigninScreen(),
    signup: (context) => const SignupScreen(),
    homepage: (context) => const Homepage(),
    mathScreen: (context) => const MathScreen(),
    gameMath1: (context) => const GameMath1Screen(),

    //Languages Game
    languageScreen: (context) => const LanguageScreen(),
    gameLetter: (context) => const LanguagesFirstLetter(),
    gameWord: (context) => const LanguagesFirstWord(),
    gameConj: (context) => const LanguageGameThree(),
    gameSort: (context) => const WordFind(),

    //admin

    admin_page2: (context) => const Adminpage(),
  };
}
