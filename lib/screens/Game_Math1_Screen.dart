import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/roomMathGameModel.dart';
import 'package:flutter_application_1/widgets/components/card_game_math.dart';
import 'package:flutter_application_1/provider/questions.dart';
import 'package:flutter_application_1/provider/room.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/timerForm.dart';

class GameMath1Screen extends ConsumerStatefulWidget {
  const GameMath1Screen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GameMath1ScreenState();
}

class _GameMath1ScreenState extends ConsumerState<GameMath1Screen> {
  var answer = List.generate(2, (index) => false);
  var index = 0;

  @override
  void initState() {
    super.initState();
    final room = ref.read(roomProvider);
    final roomRef = FirebaseDatabase.instance.ref('room/${room.roomName}');

    roomRef.onValue.listen((DatabaseEvent event) {
      final roomAsMap = event.snapshot.value;
      final list =
          List<String>.generate(2, (index) => (roomAsMap! as Map)['q$index']);
      room.updateQuestions(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    final room = ref.watch(roomProvider);
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const CustomTimer(
            leftSeconds: 1000,
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Column(
                    children: [
                      const Text.rich(TextSpan(
                          text: 'Điểm',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold))),
                      const Padding(padding: EdgeInsets.only(bottom: 5)),
                      Container(
                        height: 30,
                        width: 50,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xE6FFCD4D), Color(0xff362679)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 10,
                          child: Text(
                            room.currentScore.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      const Text.rich(TextSpan(
                          text: 'Cấp Độ',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold))),
                      const Padding(padding: EdgeInsets.only(bottom: 5)),
                      Container(
                        height: 30,
                        width: 50,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xE6FFCD4D), Color(0xff362679)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 10,
                          child: Text(
                            room.currentQuestion.round.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.only(bottom: 10, top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xE6FFCD4D), Color(0xff362679)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 10,
                    child: Stack(
                      children: [
                        Ink.image(
                          image: const AssetImage('images/background.jpg'),
                          fit: BoxFit.contain,
                        )
                      ],
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 10)),
                Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xE6FFCD4D), Color(0xff362679)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 10,
                    child: Stack(
                      children: [
                        Ink.image(
                          image: const AssetImage('images/background.jpg'),
                          fit: BoxFit.contain,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                children: [
                  Text(
                    room.currentQuestion.question,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  for (var i = 0; i < room.currentAnswers.length; i++)
                    GameCard(
                      answer: room.currentAnswers[i],
                      answerCardStatus: room.answersStatus[i],
                      onTap: room.isAnswerChosen
                          ? null
                          : () async {
                              await ref
                                  .read(roomProvider.notifier)
                                  .answerQuestion(i);
                            },
                    ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
