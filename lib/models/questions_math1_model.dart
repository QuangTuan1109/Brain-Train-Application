import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Questions_Math1_model {
  final int round;
  final String question;
  final String answer;
  final int point;
  final int rightAnswerIndex;
  final String? image;

  Questions_Math1_model(
      {required this.round,
      required this.question,
      required this.answer,
      required this.point,
      required this.rightAnswerIndex,
      this.image});

  List<String> get answerList => answer.split(',');

  Questions_Math1_model CopyWith({
    int? round,
    String? question,
    String? answer,
    int? point,
    int? rightAnswerIndex,
    String? image,
  }) {
    return Questions_Math1_model(
        round: round ?? this.round,
        question: question ?? this.question,
        answer: answer ?? this.answer,
        point: point ?? this.point,
        rightAnswerIndex: rightAnswerIndex ?? this.rightAnswerIndex,
        image: image ?? this.image);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'round': round,
      'question': question,
      'answer': answer,
      'point': point,
      'rightAnswerIndex': rightAnswerIndex,
      'image': image,
    };
  }

  factory Questions_Math1_model.fromMap(Map<String, dynamic> map) {
    return Questions_Math1_model(
        round: map['round'] as int,
        question: map['question'] as String,
        answer: map['answer'] as String,
        point: map['point'] as int,
        rightAnswerIndex: map['rightAnswerIndex'],
        image: map['image'] != null ? map['image'] as String : null);
  }

  String toJson() => json.encode(toMap());

  factory Questions_Math1_model.fromJson(String source) =>
      Questions_Math1_model.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Questions_Math1_model(round: $round, question: $question, answer: $answer, point: $point, rightAnswerIndex: $rightAnswerIndex, image: $image)';
  }

  @override
  bool operator ==(covariant Questions_Math1_model other) {
    if (identical(this, other)) return true;

    return other.round == round &&
        other.question == question &&
        other.answer == answer &&
        other.rightAnswerIndex == rightAnswerIndex &&
        other.image == image;
  }

  @override
  int get hashCode {
    return round.hashCode ^
        question.hashCode ^
        answer.hashCode ^
        rightAnswerIndex.hashCode ^
        image.hashCode;
  }
}
