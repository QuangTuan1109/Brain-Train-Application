import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:flutter_application_1/general/check_languages.dart';
import 'package:flutter_application_1/widgets/components/toast.dart';

class LanguageGameThree extends StatefulWidget {
  const LanguageGameThree({super.key});

  @override
  State<LanguageGameThree> createState() => _LanguageGameThreeState();
}

class _LanguageGameThreeState extends State<LanguageGameThree> {
  final int answerDurationInSeconds = 60;
  final int pointPerCorrectAnswer = 200;
  int currentIndex = 0;
  String listLetter = "lib/data/data_language/word.json";
  Duration answerDuration = const Duration();
  Timer? countdownTimer;

  TextEditingController controller = TextEditingController();
  late Future<String> firstCharacter;
  List<String> _answer = [' ', ' ', ' '];
  String firstLetter = "";
  int _point = 0;

  // Timer Handler
  void startTimer() {
    answerDuration = Duration(seconds: answerDurationInSeconds);

    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = answerDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        setEndTimer();
        // changeStatus(GameStatus.end);
      } else {
        answerDuration = Duration(seconds: seconds);
      }
    });
  }

  void setEndTimer() {
    countdownTimer!.cancel();
    _showNotify("Hết giờ", "Điểm: $_point", () {
      Navigator.of(context).pop();
      setState(() {
        answerDuration = const Duration(seconds: 60);
        _point = 0;
        firstLetter = "";
        _answer = [
          ' ',
          ' ',
          ' ',
        ];
        fetchRandomCharacter();
        controller.clear();
        startTimer();
      });
    });
  }

  Future<String> fetchRandomCharacter() async {
    final String response = await rootBundle.loadString(listLetter);
    final data = await json.decode(response);
    currentIndex = Random().nextInt(data["letter"].length);
    if (data.isNotEmpty) {
      String firstCharacter = data["letter"][currentIndex].split(' ')[0];
      _answer.add(firstCharacter);
      return firstCharacter;
    }

    throw Exception('Failed to load random character in the dictionary');
  }

  Future<bool> checkValidWord(String word) async {
    Map<String, String> headers = {'Content-type': 'application/json'};
    final response = await http.post(Uri.parse('$validlanguagesUrl'),
        headers: headers, body: jsonEncode({'text': word}));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  // Logic Handler
  void handleClickCheck() async {
    String userAnswer = controller.text;
    String firstChar = _answer[_answer.length - 1];
    String checkingWord = '$firstChar $userAnswer';

    bool isValidWord = await checkValidWord(checkingWord);
    if (isValidWord) {
      if ("$userAnswer" == _answer[_answer.length - 2] &&
          "$userAnswer" == _answer[_answer.length - 4]) {
        showToastErrorMatch();
      }
      if ("$userAnswer" != _answer[_answer.length - 2] ||
          "$userAnswer" != _answer[_answer.length - 4]) {
        _answer.add(userAnswer);
        setState(() {
          _point += pointPerCorrectAnswer;
          // Restart timer
          answerDuration = Duration(seconds: answerDurationInSeconds);
        });
      }
    } else {
      showToastError();
    }
    setState(() {
      controller.text = '';
      // wordInput = "";
    });
  }

  @override
  void initState() {
    super.initState();
    firstCharacter = fetchRandomCharacter();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    countdownTimer!.cancel();
    controller.dispose();
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
    final seconds = answerDuration.inSeconds;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trò chơi nối chữ'),
        backgroundColor: Colors.yellow[600],
      ),
      body: SingleChildScrollView(
          child: FutureBuilder<String>(
        future: firstCharacter,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(children: [
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
                              "Thời gian: ",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              "$seconds",
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
                      bottom: 10,
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
                              "$_point",
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
              const SizedBox(
                height: 10,
              ),
              const Text('Nối từ',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
              Text("Từ đầu tiên: ${_answer[3]}",
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
              const SizedBox(
                height: 15,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                    width: 100,
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.yellow,
                        width: 5.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(_answer[_answer.length - 4],
                        style: const TextStyle(
                            fontSize: 20, color: Colors.black))),
                Container(
                    width: 100,
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.yellow,
                        width: 5.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(_answer[_answer.length - 3],
                        style: const TextStyle(
                            fontSize: 20, color: Colors.black))),
                Container(
                    width: 100,
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.yellow,
                        width: 5.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(_answer[_answer.length - 2],
                        style: const TextStyle(
                            fontSize: 20, color: Colors.black))),
              ]),
              const SizedBox(
                height: 15,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                    width: 100,
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.yellow,
                        width: 5.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(_answer[_answer.length - 1],
                        style: const TextStyle(
                            fontSize: 20, color: Colors.black))),
                Container(
                    width: 100,
                    height: 70,
                    alignment: Alignment.center,
                    child: TextField(
                      controller: controller,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20, height: 1.7),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 1.0,
                          ),
                        ), // OutlineInputBorder
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.yellow,
                            width: 5.0,
                          ), // OutlineInputBorder
                        ),
                        hintText: 'Nhập từ',
                      ),
                    ))
              ]),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: controller.text.isNotEmpty
                    ? () => handleClickCheck()
                    : null,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[600],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 14),
                    textStyle: const TextStyle(fontSize: 24)),
                child: const Text('Gửi'),
              )
            ]);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const Center(
              heightFactor: 22.0, child: CircularProgressIndicator());
        },
      )),
    );
  }
}
