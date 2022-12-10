import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:flutter_application_1/general/check_languages.dart';
import 'package:flutter_application_1/widgets/components/toast.dart';

class LanguagesFirstWord extends StatefulWidget {
  const LanguagesFirstWord({super.key});

  @override
  State<LanguagesFirstWord> createState() => _LanguagesFirstWordState();
}

class _LanguagesFirstWordState extends State<LanguagesFirstWord> {
  String listWord = "lib/data/data_language/question_languages_two.json";
  List<String> _firstWord = [""];
  String wordInput = "";
  int statusCode = 0;
  int score = 0;
  String firstWord = "";
  int currentIndex = 0;
  List wordList = [];
  Timer? countdownTimer;
  TextEditingController controllerInput = TextEditingController();
  Duration timeDuration = const Duration(seconds: 300);
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
    _showNotify("Hết giờ", "Điểm: $score", () {
      Navigator.of(context).pop();
      setState(() {
        timeDuration = const Duration(seconds: 300);
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
        builder: (BuildContext context) => AlertDialog(
              title: Text(title),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(content),
                  ],
                ),
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: <Widget>[
                TextButton(
                  child: const Text('Chơi lại'),
                  onPressed: () => callback(),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tìm Từ'),
          backgroundColor: Colors.yellow[600],
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Nếu muốn thêm giá trị   scoreBoard("Time", "$time"),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                    ),
                    child: Container(
                      margin: EdgeInsets.all(16),
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 22),
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                          // Bảng trắng nhỏ 2 bên
                          children: [
                            const Text(
                              "Thời gian",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              "${timeDuration.inSeconds}",
                              style: const TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                    ),
                    child: Container(
                      margin: EdgeInsets.all(16),
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 22),
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                          // Bảng trắng nhỏ 2 bên
                          children: [
                            const Text(
                              "Điểm: ",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              "${score}",
                              style: const TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                child: Text(
                    "Nhập từ thích hợp bắt đầu bằng chữ '$firstWord' : ",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                    wordInput == ""
                        ? "$firstWord _____"
                        : "$firstWord $wordInput",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30)),
              ),
              SizedBox(
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
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
                    child: const Text('Gửi'),
                  )),
            ],
          ),
        )));
  }
}
