import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/auth.dart';

import 'package:flutter_application_1/screens/Signin_Screen.dart';
import 'package:flutter_application_1/screens/home/homepage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'general/app_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  runApp(ProviderScope(
    child: MyApp(),
    overrides: [spProvider.overrideWithValue(sharedPreferences)],
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final auth = ref.watch(authProvider);
      final futureAuth = ref.watch(futureAuthProvider);
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: futureAuth.when(data: (data) {
          return auth.isAuth ? Homepage() : SigninScreen();
        }, error: (e, st) {
          return Scaffold(
            body: Center(child: Text(e.toString())),
          );
        }, loading: () {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }),
        routes: RouteGenerator.routes,
      );
    });
  }
}
