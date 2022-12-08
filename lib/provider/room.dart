import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/data_question_math1.dart';
import 'package:flutter_application_1/models/questions_math1_model.dart';
import 'package:flutter_application_1/models/roomMathGameModel.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/provider/auth.dart';
import 'package:flutter_application_1/provider/questions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final roomProvider = ChangeNotifierProvider<RoomNotifier>((ref) {
  return RoomNotifier(ref.watch(authProvider.notifier).user);
});

class RoomNotifier extends ChangeNotifier {
  RoomNotifier(this.user);
  final Users user;

  roomMathGameModel? room;
  List questions = [100];
  int currentQuestionIndex = 0;
  bool isMyFault = false;
  bool amIRight = false;
  bool isAnswerChosen = false;
  bool? isUserAnswering;
  bool? isRightAnswer;
  int currentSeconds = 0;
  int? indexCurrentAnswer;
  int currentScore = 0;

  // Colors of status after answer
  Color get borderColor {
    switch (isRightAnswer) {
      case true:
        return Colors.green;
      case false:
        return Colors.redAccent;

      default:
        return Colors.white;
    }
  }

  // Get question in data file
  Questions_Math1_model get currentQuestion =>
      questionsList[currentQuestionIndex];

  List<String> get currentAnswers => currentQuestion.answerList;

  // List all questions in data file
  List<Questions_Math1_model> get questionsList => data_question_math1
      .sublist(0, 100)
      .map((q) => Questions_Math1_model.fromMap(q))
      .toList();

  // The status of answer
  List<AnswerCardStatus> get answersStatus {
    if (isAnswerChosen) {
      return List.generate(currentAnswers.length, (index) {
        if (index == currentQuestion.rightAnswerIndex - 1) {
          return AnswerCardStatus.right;
        }
        return AnswerCardStatus.disable;
      });
    } else {
      return List.generate(currentAnswers.length, (index) {
        return AnswerCardStatus.normal;
      });
    }
  }

  bool get isDone => !questions.contains('');

  bool get isCurrentQuestionAnswered => questions[currentQuestionIndex] != '';

  String? get Player => room?.Player;
  String? get roomName => room?.roomName;

  // Handle scores
  int get Score {
    currentScore += currentQuestion.point;

    return currentScore;
  }

  // Update new question when finished before question
  updateQuestions(List<String> list) {
    questions = list;
  }

  Timer? timer;
  int seconds = 60;

  // Initial time
  void TimeGameMath1() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds == 0) {
        timer.cancel();
      } else {
        seconds--;
      }
      notifyListeners();
    });
  }

  // Handle answer
  Future<void> answerQuestion(int index) async {
    final isRightAns = currentQuestion.rightAnswerIndex - 1 == index;

    isUserAnswering = true;
    isAnswerChosen = true;
    isRightAnswer = isRightAns;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));

    isUserAnswering = null;
    if (isRightAns) {
      amIRight = true;
    } else {
      isMyFault = true;
    }

    if (currentQuestionIndex < 100) currentQuestionIndex++;
    isMyFault = false;
    amIRight = false;
    isAnswerChosen = false;
    isRightAnswer = null;
    notifyListeners();

    // Handle time
    int indexRightAnswerTime = 0;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isRightAns) {
        indexRightAnswerTime++;
      } else {
        indexRightAnswerTime = 0;
      }

      if (indexRightAnswerTime == 5 && indexRightAnswerTime != 0) {
        seconds + 10;
      } else if (!isRightAns) {
        seconds - 2;
      }

      if (seconds == 0) {
        timer.cancel();
      } else {
        seconds--;
      }
      notifyListeners();
    });

    // Handle Score
    if (isRightAns) {
      Score;
    }
  }
}
