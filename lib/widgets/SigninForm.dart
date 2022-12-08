import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/components/InputForm.dart';
import 'package:flutter_application_1/widgets/components/button.dart';
import 'package:flutter_application_1/widgets/components/checkboxList.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({Key? key, this.isSignup = false}) : super(key: key);

  final bool isSignup;

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  late TextEditingController emailConntroller;
  late TextEditingController passwordConntroller;

  late FocusNode emailNode;
  late FocusNode passwordNode;

  late bool _isVisible = false;
  late bool isSubmitted;
  late bool isLoading;

  String? get emailErrorText {
    final text = emailConntroller.value.text;

    if (!isSubmitted && !emailNode.hasFocus) {
      return null;
    }

    if (text.isEmpty) {
      return 'Tài khoản không được để trống!';
    }
  }

  String? get passwordErrorText {
    final text = passwordConntroller.value.text;

    if (!isSubmitted && !passwordNode.hasFocus) {
      return null;
    }

    if (text.isEmpty) {
      return 'Mật khẩu không được để trống!';
    }
  }

  @override
  void initState() {
    super.initState();
    emailConntroller = TextEditingController();
    passwordConntroller = TextEditingController();
    emailNode = FocusNode();
    passwordNode = FocusNode();

    isSubmitted = false;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InputForm(
            onFocusChange: (_) => setState((() {})),
            onChanged: (_) => setState((() {})),
            onFieldSubmitted: (_) => emailNode.requestFocus(),
            obscureText: _isVisible,
            controller: emailConntroller,
            focusNode: emailNode,
            errorText: emailErrorText,
            text: 'Tài Khoản',
            icon: const Icon(
              Icons.email,
              color: Color(0xE6FFCD4D),
            ),
          ),
          InputForm(
            onFocusChange: (_) => setState((() {})),
            onChanged: (_) => setState((() {})),
            onFieldSubmitted: (_) => passwordNode.requestFocus(),
            obscureText: _isVisible ? false : true,
            controller: passwordConntroller,
            focusNode: passwordNode,
            errorText: passwordErrorText,
            text: 'Mật Khẩu',
            icon: const Icon(
              Icons.lock,
              color: Color(0xE6FFCD4D),
            ),
          ),
          Consumer(builder: (context, ref, child) {
            return Button(
                onPressed: () async {
                  setState(() {
                    isSubmitted = true;
                  });
                  if (emailErrorText != null || passwordErrorText != null) {
                    Navigator.of(context).pushNamed('/gameMath1');
                  }
                },
                text: 'Đăng Nhập');
          })
        ],
      ),
    );
  }
}
