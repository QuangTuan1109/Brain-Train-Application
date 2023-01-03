import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/SigninForm.dart';
import 'package:flutter_application_1/widgets/components/iconButton.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SigninScreen extends ConsumerWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    Container(
                      margin: const EdgeInsets.only(top: 103, bottom: 20),
                      child: Image.asset('images/logo-transparent.png',
                          width: 300),
                    ),
                    const Text(
                      'Đăng Nhập',
                      style: TextStyle(fontSize: 30),
                    ),
                    const SigninForm(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Row(
                        children: [
                          const Text.rich(TextSpan(
                              text: 'Chưa có tài khoản?',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16))),
                          IconButtonCus(
                              onPressed: (() {
                                Navigator.of(context).pushNamed('/homepage');
                              }),
                              text: 'Đăng kí ngay!')
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
