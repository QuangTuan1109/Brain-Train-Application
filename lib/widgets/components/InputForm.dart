import 'package:flutter/material.dart';

OutlineInputBorder border(Color color, [double width = 2]) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color, width: width));
}

class InputForm extends StatelessWidget {
  const InputForm(
      {super.key,
      required this.onFocusChange,
      required this.onChanged,
      required this.onFieldSubmitted,
      required this.controller,
      required this.focusNode,
      required this.errorText,
      required this.text,
      required this.icon,
      required this.obscureText});

  final String text;
  final Widget icon;
  final bool obscureText;
  final Function(bool)? onFocusChange;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Focus(
        onFocusChange: onFocusChange,
        child: TextFormField(
          textInputAction: TextInputAction.next,
          controller: controller,
          focusNode: focusNode,
          onChanged: onChanged,
          obscureText: obscureText,
          decoration: InputDecoration(
            label: Text(text),
            errorText: errorText,
            errorMaxLines: 2,
            border: border(const Color(0xE6FFCD4D)),
            enabledBorder: border(Colors.white60),
            focusedBorder: border(const Color(0xE6FFCD4D), 3),
            errorBorder: border(Colors.redAccent),
            prefixIcon: icon,
          ),
          onFieldSubmitted: onFieldSubmitted,
        ),
      ),
    );
  }
}
