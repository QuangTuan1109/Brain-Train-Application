import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:flutter_application_1/general/check_languages.dart';
import 'package:flutter_application_1/widgets/components/toast.dart';

import '../../../widgets/components/custom_button.dart';

class LanguagesFirstWord extends StatefulWidget {
  const LanguagesFirstWord({super.key});

  @override
  State<LanguagesFirstWord> createState() => _LanguagesFirstWordState();
}

class _LanguagesFirstWordState extends State<LanguagesFirstWord> {
  String listWord = "lib/data/data_language/question_languages_two.json";
  final int answerDurationInSeconds = 300;
  List<String> _firstWord = [""];
  String wordInput = "";
  int statusCode = 0;
  int numberWord = 0;
  int score = 0;
  String firstWord = "";
  int currentIndex = 0;
  List wordList = [];
  Timer? countdownTimer;
  TextEditingController controllerInput = TextEditingController();
  Duration timeDuration = const Duration();
  @override
  void initState() {
    super.initState();
    fetchRandomCharacter();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    countdownTimer!.cancel();
    controllerInput.dispose();
  }

  void setEndTimer() {
    countdownTimer!.cancel();
    _showNotify("Hết giờ", "$score", () {
      Navigator.of(context).pop();
      setState(() {
        timeDuration = const Duration();
        score = 0;
        _firstWord = [''];
        firstWord = "";
        wordInput = "";
        fetchRandomCharacter();
        controllerInput.clear();
        startTimer();
      });
    });
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = timeDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        setEndTimer();
      } else {
        timeDuration = Duration(seconds: seconds);
      }
    });
  }

  void startTimer() {
    timeDuration = Duration(seconds: answerDurationInSeconds);
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  Future<bool> checkValidWord(String value) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    final response = await http.post(Uri.parse("$validlanguagesUrl"),
        headers: headers, body: jsonEncode({"text": value}));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> checkMatchWord(String value) async {
    String userAnswer = controllerInput.text;
    for (int i = 0; i < _firstWord.length; i++) {
      if ("$userAnswer" == _firstWord[i]) {
        return false;
      }
    }
    return true;
  }

  Future<void> fetchRandomCharacter() async {
    final String response = await rootBundle.loadString(listWord);
    final data = await json.decode(response);
    currentIndex = Random().nextInt(data["word"].length);
    setState(() {
      String firstCharacter = data["word"][currentIndex].split(' ')[0];
      _firstWord.add(firstCharacter);
      firstWord = _firstWord[1];
      wordList = data["word"];
    });
  }

  void handleClickCheck() async {
    String userAnswer = controllerInput.text;
    String firstWord = _firstWord[1];
    numberWord = _firstWord.length - 1;
    String checkingWord = "$firstWord $userAnswer";
    bool isValidWord = await checkValidWord(checkingWord);
    bool isMatchWord = await checkMatchWord(checkingWord);
    if (!isMatchWord) {
      showToastErrorMatch();
    }
    if (!isValidWord) {
      showToastError();
    }

    if (isValidWord && isMatchWord) {
      _firstWord.add(userAnswer);
      score += 200;
      showToastCorrect("+ 200");
    }
    setState(() {
      controllerInput.clear();
      wordInput = "";
    });
  }

  void handleCheckResult() {
    if (wordInput.isNotEmpty) {
      handleClickCheck();
    }
  }

  Future<void> _showNotify(
      String title, String content, Function callback) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,
                style: const TextStyle(
                    fontSize: 40,
                    color: Colors.red,
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [Color(0xFFFFF9C4), Color(0xFFF9A825)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              children: [
                const Positioned(
                  bottom: -3,
                  left: -5,
                  right: -250,
                  child: Image(
                    image: AssetImage('assets/images/cat-clap.gif'),
                    height: 100,
                    width: 200,
                    //   width:400,
                  ),
                ),
                Positioned(
                  bottom: -30,
                  left: -5,
                  right: -5,
                  child: Image.asset(
                    'assets/images/roi.png',
                    width: 700,
                    height: 400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        "Số từ đúng: $numberWord",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Điểm của bạn:        ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/poly-twist-knots.png',
                                  width: 170,
                                ),
                                Text(
                                  content,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      decoration: TextDecoration.none),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CustomButton(
            padding: 0,
            text: 'Chơi Lại',
            onPressed: () => callback(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [Color(0xFFFFD740), Color(0xFFF9A825)],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            // ),
            color: Colors.white,
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              const Positioned(
                bottom: -35,
                left: -5,
                right: -290,
                child: Image(
                  image: AssetImage('assets/images/cat-angry.gif'),
                  height: 200,
                  width: 400,
                  //   width:400,
                ),
              ),

              // SvgPicture.asset(
              //   'assets/images/business-lady-do-multi-tasking.svg',
              //   // fit: BoxFit.fitHeight,
              //   height:200,
              //   width:400,
              // ),
              Column(
                children: [
                  Container(
                    // margin: const EdgeInsets.all(16),
                    height: 350,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFFFD740), Color(0xFFF9A825)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      // height:300,
                      body: SingleChildScrollView(
                        child: Center(
                          child: Column(
                            children: [
                              // const Padding(
                              //   padding: EdgeInsets.all(10),
                              //   child: Text(
                              //     'Language',
                              //     style: TextStyle(
                              //       color: Colors.green,
                              //       fontSize: 34,
                              //     ),
                              //   ),
                              // ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                height: 30,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Consumer(
                                      builder: (context, ref, child) {
                                        // final questions = ref.watch(questionsProvider);
                                        return FractionallySizedBox(
                                          alignment: Alignment.centerLeft,
                                          widthFactor: timeDuration.inSeconds /
                                              answerDurationInSeconds,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Colors.green[300],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    // Image.asset(
                                    //   'assets/images/slow-loading.png',
                                    //   width: 3980,
                                    //   height:400,
                                    // ),
                                    Positioned(
                                      left: 10,
                                      child: Consumer(
                                        builder: (context, ref, child) {
                                          return Text(
                                              '${timeDuration.inSeconds} seconds');
                                        },
                                      ),
                                    ),
                                    const Positioned(
                                      right: 10,
                                      child: Icon(
                                        Icons.timer,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 2),
                                    child: Container(
                                      margin: const EdgeInsets.all(16),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 22),
                                      height: 250,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 70,
                                              bottom: 10,
                                            ),
                                            child: Text(
                                                "Nhập từ thích hợp bắt đầu bằng chữ $firstWord : ",
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, bottom: 20),
                                            child: Text(
                                                wordInput == ""
                                                    ? "$firstWord _____"
                                                    : "$firstWord $wordInput",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 30)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // Add the line below
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    // padding: const EdgeInsets.all(16),
                    clipBehavior: Clip.hardEdge,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Color(0xffffe0b2),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                      ),
                    ),
                  ),
                  Container(
                    // Add the line below
                    margin: const EdgeInsets.only(left: 35.0, right: 35.0),
                    clipBehavior: Clip.hardEdge,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Color(0xfffff3e0),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      SizedBox(
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 10),
                          child: TextField(
                            controller: controllerInput,
                            textAlign: TextAlign.center,
                            onChanged: (text) {
                              setState(() {
                                wordInput = text;
                              });
                            },
                            decoration: const InputDecoration(
                              // border: OutlineInputBorder(
                              //   borderRadius: BorderRadius.all(Radius.circular(30)),
                              // ),
                              hintText: "nhập từ ở đây",
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              handleCheckResult();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow[600],
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 14),
                                textStyle: const TextStyle(fontSize: 24)),
                            child: const Text('Gửi',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 20)),
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
