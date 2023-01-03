import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_application_1/data/data_attention/data_attention_two.dart';
import 'package:flutter_application_1/models/tile_model_one.dart';
// import 'package:brain_train_memory/test_screen.dart';
import 'package:flutter_application_1/widgets/components/score_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AttentionTwoScreen extends StatefulWidget {
  const AttentionTwoScreen({super.key});

  @override
  State<AttentionTwoScreen> createState() => _AttentionTwoScreenState();
}

class _AttentionTwoScreenState extends State<AttentionTwoScreen> {
  bool isLoading = false;
  Future<void> _showNotify(String title, String content, String contents,
      String img, Function callback) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => Container(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            //Alignment at Center
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21),
              ),
              child: Stack(
                children: [
                  SizedBox(
                    width: 350,
                    height: 270,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                        // color: Color(0xffe1d7c6),
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFFF9C4), Color(0xFFF9A825)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  // Title
                  Positioned(
                    left: 0,
                    top: 20,
                    child: Align(
                      child: SizedBox(
                        width: 350,
                        height: 40,
                        child: Container(
                          child: Center(
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 60,
                    child: SizedBox(
                      height: 115,
                      width: 350,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            img,
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // content
                  Positioned(
                    left: 0,
                    bottom: 55,
                    child: Align(
                      child: SizedBox(
                        width: 350,
                        height: 40,
                        child: Center(
                          child: AutoSizeText(
                            content,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Button
                  Positioned(
                    left: 115,
                    bottom: 15,
                    child: SizedBox(
                      height: 40,
                      width: 120,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          onPressed: () => callback(),
                          child: Text(
                            contents,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void endGame() {
    // countdownTimer!.cancel();
    // displayCountdownTimer!.cancel();
    _showNotify("Điểm: $totalScore", "Thời gian trug bình: $arg_time",
        "Chơi lại", "assets/correct.png", () {
      Navigator.of(context).pop();
      setState(() {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => TestScreen(),
        //     ));
        pairs = listOfList[Random().nextInt(4)];
        start();
      });
    });
  }

  void showCorrect() {
    // Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: "Chính xác: +200",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void showExist() {
    // Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: "Bạn đã chọn hình này!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void showWrong() {
    // Fluttertoast.cancel();

    Fluttertoast.showToast(
      msg: "Không chính xác",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.red[900],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  getTimer() {
    if (level == 1) {
      startTimer();
    } else if (level == 2) {
      timerDuration = Duration(seconds: 20);
      startTimer();
    } else if (level == 3) {
      timerDuration = Duration(seconds: 25);
      startTimer();
    } else if (level == 4) {
      timerDuration = Duration(seconds: 30);
      startTimer();
    } else if (level == 5) {
      timerDuration = Duration(seconds: 35);
      startTimer();
    } else if (level == 6) {
      timerDuration = Duration(seconds: 40);
      startTimer();
    } else if (level == 7) {
      timerDuration = Duration(seconds: 45);
      startTimer();
    } else if (level == 8) {
      timerDuration = Duration(seconds: 50);
      startTimer();
    }
  }

  Duration timerDuration = Duration(seconds: 15);
  void setCountdown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = timerDuration.inSeconds - reduceSecondsBy;
      if (seconds <= 0) {
        countdownTimer!.cancel();
        timerDuration = const Duration(seconds: 10);
        start();
      } else {
        timerDuration = Duration(seconds: seconds);
        responseTime += 1;
      }
    });
  }

  Timer? countdownTimer;
  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountdown());
  }

  // correct = getCorrect();
  start() {
    save = [];
    numOfPairs = 0;
    getTimer();
    if (level == 1) {
      visible = pickRandomItemsAsListWithSubList(pairs, 3);
      visible = visible + visible;
      visible.shuffle();
    } else if (level == 2) {
      visible = pickRandomItemsAsListWithSubList(pairs, 4);
      visible = visible + visible;
      visible.shuffle();
    } else if (level == 3) {
      visible = pickRandomItemsAsListWithSubList(pairs, 5);
      visible = visible + visible;
      visible.shuffle();
    } else if (level == 4) {
      visible = pickRandomItemsAsListWithSubList(pairs, 6);
      visible = visible + visible;
      visible.shuffle();
    } else if (level == 5) {
      visible = pickRandomItemsAsListWithSubList(pairs, 7);
      visible = visible + visible;
      visible.shuffle();
    } else if (level == 6) {
      visible = pickRandomItemsAsListWithSubList(pairs, 8);
      visible = visible + visible;
      visible.shuffle();
    } else if (level == 7) {
      visible = pickRandomItemsAsListWithSubList(pairs, 9);
      visible = visible + visible;
      visible.shuffle();
    } else if (level == 8) {
      visible = pickRandomItemsAsListWithSubList(pairs, 10);
      visible = visible + visible;
      visible.shuffle();
    }
    returnColumn();
    // pairs.shuffle();
  }

  getLoading() {
    return Center(
      child: SpinKitFadingCube(
        size: 50,
        duration: Duration(seconds: 1),
        itemBuilder: ((context, index) {
          final colors = [Colors.white, Colors.amber];
          final color = colors[index % colors.length];

          return DecoratedBox(
            decoration: BoxDecoration(color: color),
          );
        }),
      ),
    );
  }

  _isLoading() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isLoading = false;
    });
    await start();
  }

  // l1 = 6
  // l2 = 8
  // l3 = 10
  // l4 = 12
  // l5 = 14
  // l6 = 16
  // l7 = 18
  // l10 = 20
  int columns = 0;
  returnColumn() {
    if (visible.length <= 9) {
      columns = 3;
    } else if (visible.length <= 20) {
      columns = 4;
    }
    return columns;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pairs = listOfList[Random().nextInt(4)];
    score = 0;
    level = 1;
    start();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    countdownTimer!.cancel();
  }

  final double runSpacing = 10;
  final double spacing = 4;
  // final int columns = 4;

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    final w = (MediaQuery.of(context).size.width - runSpacing * (columns - 1)) /
        columns;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffd23369), Color(0xffff597b)],
              begin: FractionalOffset(0.5, 1),
            ),
          ),
          width: screen_width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icons
              Row(
                // crossAxisAlignment: CrossAxisAlignment.spaceBetween,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          print("Back Here");
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const HomePage()));
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                        iconSize: 30,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          print("Back Here");
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const HomePage()));
                        },
                        icon: const Icon(Icons.lightbulb_outline),
                        iconSize: 30,
                      ),
                      IconButton(
                        onPressed: () {
                          print("Back Here");
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const HomePage()));
                        },
                        icon: const Icon(Icons.settings),
                        iconSize: 30,
                      ),
                    ],
                  ),
                ],
              ),
              // SizedBox(
              //   height: 50,
              // ),
              Container(
                width: screen_width,
                child: Column(
                  children: [
                    Text(
                      "Lượt chơi: $level/10",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        scoreBoard("Thời gian", "${timerDuration.inSeconds}"),
                        // scoreBoard("Điểm", "$score"),
                        scoreBoard("Điểm", "$score"),
                      ],
                    ),
                  ],
                ),
              ),
              isLoading
                  ? Expanded(
                      child: Center(
                      child: getLoading(),
                    ))
                  : Expanded(
                      child: Center(
                        child: Container(
                          // decoration: BoxDecoration(color: Colors.amber),
                          child: Wrap(
                            runSpacing: runSpacing,
                            spacing: spacing,
                            alignment: WrapAlignment.center,
                            children: List.generate(visible.length, (index) {
                              return Container(
                                width: w,
                                height: w,
                                child: Tile(
                                    imageAssetPath:
                                        visible[index].getImageAssetPath(),
                                    tileIndex: index,
                                    parent: this),
                              );
                            }),
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class Tile extends StatefulWidget {
  String imageAssetPath;
  int tileIndex;
  _AttentionTwoScreenState parent;
  Tile({
    required this.imageAssetPath,
    required this.parent,
    required this.tileIndex,
  });
  // const Tile({super.key});

  @override
  // State<Tile> createState() => _TileState();
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          // setState(() {
          //   pairs[widget.tileIndex].setIsSelected(true);
          // });

          if (selectedImageAssetPath != []) {
            selectedImageAssetPath.add(widget.imageAssetPath);
            print(selectedImageAssetPath);
            selectedIndex = widget.tileIndex;

            if (numOfPairs < visible.length / 2) {
              contain =
                  save.where((element) => element == selectedImageAssetPath[0]);
              if (contain.isEmpty) {
                // Valaue not exist
                if (selectedImageAssetPath.length == 2) {
                  // if(save == )
                  if (selectedImageAssetPath[0] == selectedImageAssetPath[1]) {
                    print("correct");
                    widget.parent.setState(() {
                      widget.parent.showCorrect();
                      save.add(selectedImageAssetPath[0]);
                      score += 200;
                      numOfPairs++;
                    });
                  } else {
                    print("wrong");
                    widget.parent.setState(() {
                      widget.parent.showWrong();
                    });
                  }

                  print("save: $save");

                  selectedImageAssetPath = [];
                }
              } else {
                // Value exist
                print("Value exist");
                widget.parent.setState(() {
                  widget.parent.showExist();
                });
                selectedImageAssetPath = [];
              }
              if (numOfPairs == visible.length / 2) {
                widget.parent.setState(() {
                  // widget.parent.endGame();
                  widget.parent.countdownTimer!.cancel();
                  level++;
                  widget.parent._isLoading();
                  // widget.parent.start();
                });
              }
            }
            if (level == 10) {
              widget.parent.setState(() {
                widget.parent.countdownTimer!.cancel();
                widget.parent.endGame();
              });
            }
          }
          arg_time = responseTime / 8; // Get
          bonus = score / arg_time;
          totalScore = score + bonus; // Get
          print("You click me");
          // print(pairs[widget.tileIndex].getIsSelected());
          // print(pairs[widget.tileIndex].getImageAssetPath());
          print(widget.imageAssetPath);
        }
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: Card(
          elevation: 10,
          child: Image.asset(widget.imageAssetPath),
        ),
      ),
    );
  }
}
