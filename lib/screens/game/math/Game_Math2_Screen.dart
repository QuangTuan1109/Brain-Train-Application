import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/auth.dart';
import 'package:flutter_application_1/provider/questions.dart';
import 'package:flutter_application_1/provider/room.dart';
import 'package:flutter_application_1/widgets/components/card_game_math2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../widgets/timerForm.dart';

class GameMath2Screen extends ConsumerStatefulWidget {
  const GameMath2Screen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GameMath2ScreenState();
}

class _GameMath2ScreenState extends ConsumerState<GameMath2Screen> {
  var answer = List.generate(4, (index) => false);
  var index = 0;

  @override
  void initState() {
    super.initState();
    final room = ref.read(roomProvider);
    final roomRef = FirebaseDatabase.instance.ref('room/${room.roomName}');

    roomRef.onValue.listen((DatabaseEvent event) {
      final roomAsMap = event.snapshot.value;
      final list =
          List<String>.generate(4, (index) => (roomAsMap! as Map)['q$index']);
      room.updateQuestions(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    final room = ref.watch(roomProvider);
    final auth = ref.watch(authProvider);
    return SafeArea(
      child: Scaffold(
          body: Container(
              child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xE6FFCD4D),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 21,
                      backgroundColor: const Color(0xff37EBBC),
                      child: CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(
                          auth.user.profilePicture,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${auth.user.name}',
                      style: const TextStyle(
                        color: Color(0xff001663),
                      ),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('AppRoute.settings');
                },
                icon: const Icon(Icons.settings),
                color: Colors.black,
              )
            ],
          ),
        ),
        Divider(),
        const CustomTimer(
          leftSeconds: 1000,
        ),
        Container(
          padding: EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Column(
                  children: [
                    const Text.rich(TextSpan(
                        text: 'Kỷ Lục',
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold))),
                    const Padding(padding: EdgeInsets.only(bottom: 5)),
                    Text(
                      '100000',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    const Text.rich(TextSpan(
                        text: 'Điểm',
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold))),
                    const Padding(padding: EdgeInsets.only(bottom: 5)),
                    Text(
                      room.currentScore.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
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
                    Text(
                      room.currentQuestionMath2.level.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    const Text.rich(TextSpan(
                        text: 'Vòng',
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold))),
                    const Padding(padding: EdgeInsets.only(bottom: 5)),
                    Text(
                      room.currentQuestionMath2.round.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(padding: EdgeInsets.only(top: 10)),
        Text(
          room.currentQuestionMath2.question,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Container(
          child: Expanded(
              child: GridView.builder(
            itemCount: room.currentAnswersGameMath2.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 1.0),
            itemBuilder: (BuildContext context, int index) {
              return GameCard2(
                answer: room.currentAnswersGameMath2[index],
                answerCardStatus: room.answersStatusGameMath2[index],
                onTap: room.isAnswerChosen
                    ? null
                    : () async {
                        setState(() {
                          room.isPressedList[index] =
                              !room.isPressedList[index];
                        });
                        // print(room.indexAns);
                        await ref
                            .read(roomProvider.notifier)
                            .answerQuestionGameMath2(index);
                      },
              );
            },
          )),
        )
      ]))),
    );
  }
}
