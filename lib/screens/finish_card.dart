import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/auth.dart';
import 'package:flutter_application_1/widgets/components/button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../provider/questions.dart';
import '../widgets/score_card.dart';

class FinishLevelScreen extends ConsumerWidget {
  const FinishLevelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questions = ref.watch(questionsProvider);
    final auth = ref.watch(authProvider);
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff1F1147), Color(0xff362679)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Kết quả',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xff37EBBB),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Text(
                'Số câu trả lời đúng: ',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '${questions.rightAnswer}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xff37EBBB),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [Color(0xff7A5CFB), Color(0xff44348C)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: -5,
                      left: -5,
                      right: -5,
                      child: SvgPicture.asset(
                        'images/score_circle.jpg',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Text(
                            'Điểm',
                            style: TextStyle(fontSize: 25),
                          ),
                          ScoreCard(
                            score: questions.currentScore ?? 0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Button(
              //   padding: 0,
              //   text: 'Next Level',
              //   onPressed: () {
              //     Navigator.pop(context);
              //     if (auth.user.offlineLevel == questions.currentLevel) {
              //       auth.nextOfflineLevel(questions.currentRating);
              //     }
              //     questions.reset();
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
