import 'package:flutter/material.dart';

class IconButtonCus extends StatelessWidget {
  const IconButtonCus({
    Key? key,
    this.textColor = const Color(0xE6FFCD4D),
    required this.onPressed,
    required this.text,
  });

  final Color textColor;
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
