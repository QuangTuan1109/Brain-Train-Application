import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/data/data_question_math1.dart';
import 'package:flutter_application_1/models/questions_math1_model.dart';

enum AnswerCardStatus { normal, disable, erorr, right, isPressed }

class Questions extends ChangeNotifier {
  int? currentLevel;
  int currentQuestionIndex = 0;
  int? currentQuestionAnswerIndex;
  int rightAnswer = 0;
  bool isFinish = false;
  int? currentScore;

  Timer? timer;
  int seconds = 60;

  Questions_Math1_model get currentQuestion =>
      questions[currentLevel! * 4 + currentQuestionIndex];

  List<String> get currentAnswers => currentQuestion.answerList;

  Timer? questionTimer;
  List<Questions_Math1_model> questions =
      data_question_math1.map((q) => Questions_Math1_model.fromMap(q)).toList();

  //bool get isChoseAnswer => answersStatus.contains(AnswerCardStatus.right);

  // List<AnswerCardStatus> get answersStatus {
  //   if (currentQuestionAnswerIndex == null) {
  //     return List.generate(currentQuestion.answerList.length,
  //         (index) => AnswerCardStatus.normal);
  //   } else if (currentQuestionAnswerIndex ==
  //       currentQuestion.rightAnswerIndex - 1) {
  //     return List.generate(currentQuestion.answerList.length, (index) {
  //       if (index == currentQuestionAnswerIndex) {
  //         return AnswerCardStatus.right;
  //       }
  //       return AnswerCardStatus.disable;
  //     });
  //   } else {
  //     return List.generate(currentQuestion.answerList.length, (index) {
  //       if (index == currentQuestionAnswerIndex) {
  //         return AnswerCardStatus.erorr;
  //       }

  //       if (index == currentQuestion.rightAnswerIndex - 1) {
  //         return AnswerCardStatus.right;
  //       }
  //       return AnswerCardStatus.disable;
  //     });
  //   }
  // }

  void chooseAnswer(int index) {
    currentQuestionAnswerIndex = index;
    notifyListeners();
    if (currentQuestion.rightAnswerIndex == index + 1) {
      rightAnswer++;
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex == 3) {
      currentScore = rightAnswer * (60 - seconds);

      seconds = 60;
      timer!.cancel();
      timer = null;

      isFinish = true;
    } else {
      currentQuestionIndex++;
      currentQuestionAnswerIndex = null;
    }
    notifyListeners();
  }

  void reset() {
    currentScore = null;
    seconds = 60;
    timer = null;
    currentLevel = null;
    currentQuestionIndex = 0;
    rightAnswer = 0;
    isFinish = false;
    currentQuestionAnswerIndex = null;
    notifyListeners();
  }
}
