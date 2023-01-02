import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/auth.dart';
import 'package:flutter_application_1/provider/auth_test2.dart';
import 'package:flutter_application_1/widgets/components/InputForm.dart';
import 'package:flutter_application_1/widgets/components/button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

enum Gender { male, female }

class Signup extends StatefulWidget {
  const Signup({Key? key, this.isSignup = false}) : super(key: key);

  final bool isSignup;

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> formKey = GlobalKey();
  late TextEditingController emailConntroller;
  late TextEditingController passwordConntroller;
  late TextEditingController usernameConntroller;
  late TextEditingController dateinput;
  //TextEditingController ConfirmPasswordConntroller = TextEditingController();

  Gender? _gender = Gender.male;

  late FocusNode emailNode;
  late FocusNode passwordNode;
  late FocusNode usernameNode;

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

  String? get usernameErrorText {
    final text = usernameConntroller.value.text;

    if (!isSubmitted && !usernameNode.hasFocus) {
      return null;
    }

    if (text.isEmpty) {
      return 'Tên không được để trống!';
    }
  }

  @override
  void initState() {
    super.initState();
    emailConntroller = TextEditingController();
    passwordConntroller = TextEditingController();
    usernameConntroller = TextEditingController();
    dateinput = TextEditingController();

    emailNode = FocusNode();
    passwordNode = FocusNode();
    usernameNode = FocusNode();

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
            onChanged: (value) => setState((() {})),
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
            onChanged: (value) => setState((() {})),
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
          ListTile(
            title: const Text('Nam'),
            leading: Radio<Gender>(
                fillColor: MaterialStateColor.resolveWith(
                    (states) => Color(0xE6FFCD4D)),
                focusColor: MaterialStateColor.resolveWith(
                    (states) => Color(0xE6FFCD4D)),
                value: Gender.male,
                groupValue: _gender,
                onChanged: (Gender? value) {
                  setState(() {
                    _gender = value;
                  });
                }),
          ),
          ListTile(
            title: const Text('Nữ'),
            leading: Radio<Gender>(
                fillColor: MaterialStateColor.resolveWith(
                    (states) => Color(0xE6FFCD4D)),
                focusColor: MaterialStateColor.resolveWith(
                    (states) => Color(0xE6FFCD4D)),
                value: Gender.female,
                groupValue: _gender,
                onChanged: (Gender? value) {
                  setState(() {
                    _gender = value;
                  });
                }),
          ),
          InputForm(
            onFocusChange: (_) => setState((() {})),
            onChanged: (value) => setState((() {})),
            onFieldSubmitted: (_) => emailNode.requestFocus(),
            obscureText: _isVisible,
            controller: usernameConntroller,
            focusNode: usernameNode,
            errorText: usernameErrorText,
            text: 'Tên Người Dùng',
            icon: const Icon(
              Icons.person,
              color: Color(0xE6FFCD4D),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(20),
              height: 100,
              child: Center(
                  child: TextField(
                controller: dateinput,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xE6FFCD4D),
                  )),
                  icon: Icon(
                    Icons.calendar_today,
                    color: Color(0xE6FFCD4D),
                  ),
                  labelText: "Ngày Sinh",
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    print(pickedDate);
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);

                    setState(() {
                      dateinput.text = formattedDate;
                    });
                  } else {
                    print("Ngày sinh chưa được chọn!!");
                  }
                },
              ))),
          Consumer(builder: (context, ref, child) {
            final auth = ref.read(authProvider);
            return Button(
                onPressed: () {
                  setState(() {
                    isSubmitted = true;
                  });
                  if (emailErrorText != null || passwordErrorText != null) {
                    return;
                  }
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    auth.Signup(
                        name: usernameConntroller.text.trim(),
                        email: emailConntroller.text,
                        password: passwordConntroller.text,
                        Gender: _gender.toString(),
                        DOB: dateinput.text);
                  } catch (e) {
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                text: 'Đăng Ký');
          })
        ],
      ),
    );
  }
}
