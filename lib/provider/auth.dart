import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/models/user_model.dart';

final spProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

enum SigninMethod { email, google }

// Future<void> addUserToLeaderboard(Users gameUser) async {
//   final uniqueId = gameUser.email!.split('@')[0];

//   final database = FirebaseDatabase.instance.ref();

//   final leaderBoardRef = database.child('leaderboard/$uniqueId');
//   await leaderBoardRef.set(gameUser.toMap());

//   // final url = Uri.parse(
//   //     'https://nasa-petacode-default-rtdb.firebaseio.com/leaderboard.json');

//   // final response = await http.post(url, body: gameUser.toJson());
//   // return json.decode(response.body)['name'];
// }

Future<User?> emailSignin(String email, String password) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return credential.user;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      throw Exception('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      throw Exception('Wrong password provided for that user.');
    } else if (e.code == 'invalid-email') {
      throw Exception('Invalid email provided for that user.');
    }
  }
  return null;
}

final authProvider = ChangeNotifierProvider<Auth>((ref) {
  return Auth();
});

final futureAuthProvider = FutureProvider<void>((ref) async {
  final auth = ref.watch(authProvider);
  await auth.getUser();
});

class Auth with ChangeNotifier {
  Users user = Users();

  bool get isAuth => user.isAuth;

  Future<void> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final loadedData = prefs.getString('user');
    print(loadedData);

    if (loadedData == null) return;

    final loadedUser = Users.fromJson(loadedData);
    user = loadedUser;
  }

  // // Singin
  Future<void> Signin(
    SigninMethod signinMethod, {
    String? name,
    String? email,
    String? password,
  }) async {
    switch (signinMethod) {
      case SigninMethod.google:
        final SigninInfo = await GoogleSignIn().signIn();

        if (SigninInfo == null) return;

        user.name = SigninInfo.displayName;
        user.email = SigninInfo.email;
        user.imageUrl = SigninInfo.photoUrl;

        break;

      default:
        final SinginInfo = await emailSignin(email!, password!);

        if (SinginInfo == null) return;

        user.name = SinginInfo.displayName;
        user.email = SinginInfo.email;
        user.imageUrl = SinginInfo.photoURL;
    }

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user', user.toJson());
    notifyListeners();
  }

  // Signup
  Future<void> Signup(
      {required String name,
      required String email,
      required String password,
      required String Gender,
      required String DOB}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) => print('Created'));

      final userInfo = await emailSignin(email, password);

      if (userInfo == null) return;

      await userInfo.updateDisplayName(name);

      user.name = name;
      user.email = userInfo.email;
      user.imageUrl = userInfo.photoURL;

      final users = Users(
        name: name,
        email: email,
        password: password,
        Gender: Gender,
        DOB: DOB,
      );
      // await addUserToLeaderboard(users);

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('Mật khẩu quá yếu');
      } else if (e.code == 'email-already-in-use') {
        print('Tài khoản đã tồn tại');
      }
    } catch (e) {
      print(e);
    }
  }

  //Logout
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    if (user.isGoogleSignin) await GoogleSignIn().signOut();
    if (user.isEmailSignin) await FirebaseAuth.instance.signOut();

    user.clearUser();

    prefs.remove('user');

    notifyListeners();
  }
}
