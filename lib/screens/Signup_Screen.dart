import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/auth.dart';
import 'package:flutter_application_1/widgets/SignupForm.dart';
import 'package:flutter_application_1/widgets/components/iconButton.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    Container(
                      margin: const EdgeInsets.only(top: 100, bottom: 20),
                      child: Image.asset('images/logo.jpg', width: 300),
                    ),
                    const Text(
                      'Đăng Ký',
                      style: TextStyle(fontSize: 30),
                    ),
                    const Signup(
                      isSignup: true,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 5),
                      child: Row(
                        children: [
                          const Text.rich(TextSpan(
                              text: 'Đã có tài khoản?',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16))),
                          IconButtonCus(
                              onPressed: (() {
                                Navigator.of(context).pushNamed('/signin');
                              }),
                              text: 'Đăng nhập!')
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
