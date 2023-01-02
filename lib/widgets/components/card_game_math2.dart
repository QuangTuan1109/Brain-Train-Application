import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/questions.dart';

Color textColor(AnswerCardStatus answerCardStatus) {
  switch (answerCardStatus) {
    case AnswerCardStatus.erorr:
      return Colors.redAccent;
    case AnswerCardStatus.right:
      return Colors.green;
    case AnswerCardStatus.disable:
      return Colors.black26;
    case AnswerCardStatus.isPressed:
      return Colors.blue.shade400;
    default:
      return Colors.black54;
  }
}

Color borderColor(AnswerCardStatus answerCardStatus) {
  switch (answerCardStatus) {
    case AnswerCardStatus.erorr:
      return Colors.redAccent;
    case AnswerCardStatus.right:
      return Colors.green;
    case AnswerCardStatus.disable:
      return Colors.grey.shade100;
    case AnswerCardStatus.isPressed:
      return Colors.blue.shade400;
    default:
      return Colors.grey.shade300;
  }
}

Color bgrColor(AnswerCardStatus answerCardStatus) {
  switch (answerCardStatus) {
    case AnswerCardStatus.erorr:
      return const Color.fromARGB(71, 255, 79, 62);
    case AnswerCardStatus.right:
      return const Color.fromARGB(55, 69, 255, 76);
    default:
      return const Color(0xE6FFCD4D);
  }
}

class GameCard2 extends ConsumerWidget {
  const GameCard2({
    super.key,
    required this.answer,
    required this.answerCardStatus,
    required this.onTap,
  });

  final String answer;
  final AnswerCardStatus answerCardStatus;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, ref) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(microseconds: 100),
        margin: const EdgeInsets.only(bottom: 30, top: 5),
        decoration: ShapeDecoration(
            color: bgrColor(answerCardStatus),
            shape: CircleBorder(
                side: BorderSide(
              color: borderColor(answerCardStatus),
              width: 3,
            ))),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
              child: Text(
            answer,
            style: TextStyle(
                color: textColor(answerCardStatus),
                fontSize: 18,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ))
        ]),
      ),
    );
  }
}
