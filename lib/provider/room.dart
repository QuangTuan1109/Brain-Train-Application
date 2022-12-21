import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/data_question_math1.dart';
import 'package:flutter_application_1/data/data_question_math2.dart';
import 'package:flutter_application_1/models/questions_math1_model.dart';
import 'package:flutter_application_1/models/questions_math2_model.dart';
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

  /*============================================ Initialy =============================================================== */

  roomMathGameModel? room;
  List questions = [100];
  int currentQuestionIndex = 0;
  bool isMyFault = false;
  bool amIRight = false;
  bool isAnswerChosen = false;
  bool isChosen = false;
  bool? isUserAnswering;
  bool? isRightAnswer;
  int currentSeconds = 0;
  int? indexCurrentAnswer;
  int currentScore = 0;
  int indexRightAnswerTime = 0;

  // Handle scores game math 1
  int get Score {
    currentScore += currentQuestion.point;

    return currentScore;
  }

  // Handle scores game math 2
  int get ScoreGameMath2 {
    for (int i = 0; i <= 8; i++) {
      for (int j = i + 1; j <= 8; ++j) {
        if (isPressedList[i] == true && isPressedList[j] == true) {
          if ((i == currentQuestionMath2.rightAnswerIndex1 - 1 ||
                  i == currentQuestionMath2.rightAnswerIndex2 - 1) &&
              (j == currentQuestionMath2.rightAnswerIndex1 - 1 ||
                  j == currentQuestionMath2.rightAnswerIndex2 - 1)) {
            currentScore += currentQuestionMath2.point;
          }
        }
      }
    }
    return currentScore;
  }

  Timer? timer;
  int seconds = 0;

  // Initial time
  void initTimeGameMath() {
    seconds = 60;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds == 0) {
        timer.cancel();
      } else {
        seconds--;
      }
      notifyListeners();
    });
  }

  /*============================================ Handle Game Math 1 =============================================================== */

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

  // Get question of game math 1 in data file
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

  // Update new question when finished before question
  updateQuestions(List<String> list) {
    questions = list;
  }

  // Handle answer math 1
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
    if (isRightAns) {
      indexRightAnswerTime++;
    } else {
      indexRightAnswerTime = 0;
    }
    if (indexRightAnswerTime % 5 == 0 && indexRightAnswerTime != 0) {
      seconds += 10;
    } else if (!isRightAns) {
      seconds -= 2;
    }

    // Handle Score
    if (isRightAns) {
      Score;
    }
  }

  /*============================================ Handle Game Math 2 =============================================================== */

  List<bool> isPressedList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  int indexAns = 0;
  int? curAns;

  // Initial time
  void initTimeGameMath2() {
    seconds = currentQuestionMath2.time;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds == 0) {
        timer.cancel();
      } else {
        seconds--;
      }
      notifyListeners();
    });
  }

  // Get question of game math 1 in data file
  Questions_Math2_model get currentQuestionMath2 =>
      questionsListGameMath2[currentQuestionIndex];

  List<String> get currentAnswersGameMath2 => currentQuestionMath2.answerList;

  // List all questions in data file
  List<Questions_Math2_model> get questionsListGameMath2 => data_question_math2
      .sublist(0, 100)
      .map((q) => Questions_Math2_model.fromMap(q))
      .toList();

  // The status of answer
  List<AnswerCardStatus> get answersStatusGameMath2 {
    if (isAnswerChosen) {
      return List.generate(currentAnswersGameMath2.length, (index) {
        if (index == currentQuestionMath2.rightAnswerIndex1 - 1 ||
            index == currentQuestionMath2.rightAnswerIndex2 - 1) {
          return AnswerCardStatus.right;
        }
        return AnswerCardStatus.disable;
      });
    } else if (isChosen) {
      return List.generate(currentAnswersGameMath2.length, (index) {
        if (isPressedList[index] == true) {
          return AnswerCardStatus.isPressed;
        }
        return AnswerCardStatus.normal;
      });
    } else {
      return List.generate(currentAnswersGameMath2.length, (index) {
        return AnswerCardStatus.normal;
      });
    }
  }

  // Handle answer math 2
  Future<void> answerQuestionGameMath2(int index) async {
    //final isRightAns = currentQuestion.rightAnswerIndex - 1 == index;

    if (isPressedList[index] == true) {
      indexAns++;
    } else {
      indexAns = 0;
    }

    if (indexAns < 2) {
      isChosen = true;
      isAnswerChosen = false;
      notifyListeners();
    } else if (indexAns == 2) {
      await Future.delayed(const Duration(seconds: 1));
      isAnswerChosen = true;
      print(isPressedList);
      ScoreGameMath2;
      notifyListeners();
      await Future.delayed(const Duration(seconds: 2));
      if (currentQuestionIndex < 100) currentQuestionIndex++;
      seconds = currentQuestionMath2.time;
      indexAns = 0;
      isChosen = false;
      isAnswerChosen = false;
      isRightAnswer = null;
      isPressedList = [
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false
      ];
      notifyListeners();
    }
  }
}
