import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Questions_Math2_model {
  final int level;
  final int round;
  final String question;
  final String answer;
  final int point;
  final int rightAnswerIndex1;
  final int rightAnswerIndex2;
  late int time;

  Questions_Math2_model(
      {required this.level,
      required this.round,
      required this.question,
      required this.answer,
      required this.point,
      required this.rightAnswerIndex1,
      required this.rightAnswerIndex2,
      required this.time});

  List<String> get answerList => answer.split(',');

  Questions_Math2_model CopyWith({
    int? level,
    int? round,
    String? question,
    String? answer,
    int? point,
    int? rightAnswerIndex1,
    int? rightAnswerIndex2,
    int? time,
  }) {
    return Questions_Math2_model(
        level: level ?? this.level,
        round: round ?? this.round,
        question: question ?? this.question,
        answer: answer ?? this.answer,
        point: point ?? this.point,
        rightAnswerIndex1: rightAnswerIndex1 ?? this.rightAnswerIndex1,
        rightAnswerIndex2: rightAnswerIndex2 ?? this.rightAnswerIndex2,
        time: time ?? this.time);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'level': level,
      'round': round,
      'question': question,
      'answer': answer,
      'point': point,
      'rightAnswerIndex': rightAnswerIndex1,
      'rightAnswerIndex2': rightAnswerIndex2,
      'time': time,
    };
  }

  factory Questions_Math2_model.fromMap(Map<String, dynamic> map) {
    return Questions_Math2_model(
        level: map['level'] as int,
        round: map['round'] as int,
        question: map['question'] as String,
        answer: map['answer'] as String,
        point: map['point'] as int,
        rightAnswerIndex1: map['rightAnswerIndex1'],
        rightAnswerIndex2: map['rightAnswerIndex2'],
        time: map['time']);
  }

  String toJson() => json.encode(toMap());

  factory Questions_Math2_model.fromJson(String source) =>
      Questions_Math2_model.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Questions_Math2_model(level: $level, $round, question: $question, answer: $answer, point: $point, rightAnswerIndex1: $rightAnswerIndex1, rightAnswerIndex2: $rightAnswerIndex2, time: $time)';
  }

  @override
  bool operator ==(covariant Questions_Math2_model other) {
    if (identical(this, other)) return true;

    return other.level == level &&
        other.round == round &&
        other.question == question &&
        other.answer == answer &&
        other.rightAnswerIndex1 == rightAnswerIndex1 &&
        other.rightAnswerIndex2 == rightAnswerIndex2 &&
        other.time == time;
  }

  @override
  int get hashCode {
    return level.hashCode ^
        round.hashCode ^
        question.hashCode ^
        answer.hashCode ^
        rightAnswerIndex1.hashCode ^
        rightAnswerIndex2.hashCode ^
        time.hashCode;
  }
}
