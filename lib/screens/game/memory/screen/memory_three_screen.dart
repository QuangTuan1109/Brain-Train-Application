import 'dart:async';
import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:brain_train_memory/data/data_memory_three.dart';
import 'package:brain_train_memory/test_screen.dart';
import 'package:brain_train_memory/widget/score_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MemoryThreeScreen extends StatefulWidget {
  const MemoryThreeScreen({super.key});

  @override
  State<MemoryThreeScreen> createState() => _MemoryThreeScreenState();
}

class _MemoryThreeScreenState extends State<MemoryThreeScreen> {
  bool init = false;
  bool displayAnswer = false;

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
    countdownTimer!.cancel();
    // displayCountdownTimer!.cancel();
    _showNotify("Hoàn Thành", "Chúc mừng bạn hoàn thành lượt chơi!", "Tiếp tục",
        "assets/correct.png", () {
      Navigator.of(context).pop();
      setState(() {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TestScreen(),
            ));
      });
    });
  }

  Duration timerDuration2 = const Duration(seconds: 3);
  void setCountdown2() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = timerDuration2.inSeconds - reduceSecondsBy;
      if (seconds <= 0) {
        countdownTimer2!.cancel();
        // levels;
        getAnswer();
        displayAnswer = false;
        if (levels <= 4) {
          startTimer();
        } else if (levels <= 8) {
          timerDuration = Duration(seconds: 15);
          startTimer();
        } else if (levels <= 10) {
          timerDuration = Duration(seconds: 20);
          startTimer();
        }
      } else {
        timerDuration2 = Duration(seconds: seconds);
      }
    });
  }

  Duration timerDuration = Duration(seconds: 10);

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

  Timer? countdownTimer2;
  void startTimer2() {
    countdownTimer2 =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountdown2());
  }

  void showCorrect() {
    // Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: "Chính xác: +200",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void showWrong() {
    // Fluttertoast.cancel();

    Fluttertoast.showToast(
      msg: "Không chính xác: +200",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.red[900],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  start() {
    levels;

    timerDuration2 = const Duration(seconds: 3);
    card = 1;
    // pairs = pairs2;
    // pairs = getPairs();
    quest = getQuestion();
    displayAnswer = true;
    getQuest();
    // Future.delayed(Duration(seconds: 3), () {
    //   displayAnswer = false;
    //   getAnswer();
    //   startTimer();
    // });
    startTimer2();
    getColumn();
  }

  getQuest() {
    if (levels <= 4) {
      // List have 4 Img of pairs
      roundPairs = pickRandomItemsAsListWithSubList(pairs, 4);
      // List get 1 Img of roundPairs
      visiblePairs = pickRandomItemsAsListWithSubList(roundPairs, 1);
      // Get index of item visiblePairs in roundPairs
      visiblePairs.forEach((element) {
        index.add(
            roundPairs.indexWhere((innerElement) => innerElement == element));
      });
      selected = true;
    } else if (levels <= 8) {
      roundPairs = pickRandomItemsAsListWithSubList(pairs, 4);
      visiblePairs = pickRandomItemsAsListWithSubList(roundPairs, 2);
      visiblePairs.forEach((element) {
        index.add(
            roundPairs.indexWhere((innerElement) => innerElement == element));
      });
      selected = true;
    } else if (levels <= 10) {
      roundPairs = pickRandomItemsAsListWithSubList(pairs, 4);
      visiblePairs = pickRandomItemsAsListWithSubList(roundPairs, 3);
      visiblePairs.forEach((element) {
        index.add(
            roundPairs.indexWhere((innerElement) => innerElement == element));
      });
      selected = true;
    }
  }

  getAnswer() {
    if (levels <= 4) {
      pairs.removeWhere((element) => roundPairs.contains(element));
      remain = pickRandomItemsAsListWithSubList(pairs, 3);
      remain = remain + visiblePairs;
      remain.shuffle();
      roundPairs.removeWhere((element) => visiblePairs.contains(element));
      roundPairs.insert(index[0], quest[0]);
      index = [];
      selected = false;
      setState(() {});
    } else if (levels <= 8) {
      pairs.removeWhere((element) => roundPairs.contains(element));
      remain = pickRandomItemsAsListWithSubList(pairs, 4);
      remain = remain + visiblePairs;
      remain.shuffle();
      roundPairs.removeWhere((element) => visiblePairs.contains(element));

      for (int i = 0; i < index.length; i++) {
        roundPairs.insert(i, quest[0]);
      }
      index = [];

      selected = false;
      setState(() {});
    } else if (levels <= 10) {
      pairs.removeWhere((element) => roundPairs.contains(element));
      remain = pickRandomItemsAsListWithSubList(pairs, 5);
      remain = remain + visiblePairs;
      remain.shuffle();
      roundPairs.removeWhere((element) => visiblePairs.contains(element));

      for (int i = 0; i < index.length; i++) {
        roundPairs.insert(i, quest[0]);
      }
      index = [];

      selected = false;
      setState(() {});
    }
  }

  getColumn() {
    if (levels <= 4) {
      numOfCard = 2;
    } else if (levels <= 8) {
      numOfCard = 3;
    } else if (levels <= 10) {
      numOfCard = 4;
    }
    return numOfCard;
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pairs = listOfList[Random().nextInt(4)];
    // _isLoading();
    start();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    countdownTimer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
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
              // Title
              Container(
                width: screen_width,
                // height: screen_height / 4.5,
                // decoration: const BoxDecoration(
                //   color: Colors.amber,
                // ),
                child: Column(
                  children: [
                    Text(
                      "Lượt chơi: $levels/10",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
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
                        scoreBoard("Điểm", "$score"),
                      ],
                    ),
                  ],
                ),
              ),
              // SizedBox(
              // height:,
              // ),
              Expanded(
                flex: 1,
                child: Container(
                    // child: init == false
                    //     ? Container(
                    //         child: CircularPercentIndicator(
                    //           circularStrokeCap: CircularStrokeCap.round,
                    //           percent: percent / 3,
                    //           animation: true,
                    //           animateFromLastPercent: true,
                    //           radius: 30.0,
                    //           lineWidth: 5.0,
                    //           progressColor: Colors.amber,
                    //           center: Text(
                    //             "$percent",
                    //             style:
                    //                 TextStyle(color: Colors.white, fontSize: 40),
                    //           ),
                    //         ),
                    //       )
                    //     : Container(),
                    ),
              ),
              // Display Question
              isLoading
                  ? Expanded(
                      flex: 10,
                      child: getLoading(),
                    )
                  : Expanded(
                      flex: 10,
                      child: Center(
                        child: Container(
                          width: screen_width,
                          // decoration: BoxDecoration(
                          //   color: Colors.amber,
                          // ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GridView(
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4),
                                children:
                                    List.generate(roundPairs.length, (index) {
                                  return Tile(
                                    imageAssetPath:
                                        roundPairs[index].getImageAssetPath(),
                                    parent: this,
                                    tileIndex: index,
                                  );
                                }),
                              ),
                              const Divider(
                                thickness: 3,
                                color: Colors.black,
                                endIndent: 30,
                                indent: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 20, top: 5),
                                    child: AutoSizeText(
                                      "Đáp án: ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        wordSpacing: 2,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              displayAnswer == false
                                  ? Container(
                                      padding: EdgeInsets.all(20),
                                      // decoration: BoxDecoration(color: Colors.deepOrange),
                                      child: GridView(
                                        shrinkWrap: true,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: numOfCard),
                                        children: List.generate(remain.length,
                                            (index) {
                                          return Tile(
                                            imageAssetPath: remain[index]
                                                .getImageAssetPath(),
                                            parent: this,
                                            tileIndex: index,
                                          );
                                        }),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                    ),
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
  _MemoryThreeScreenState parent;
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
        // widget.parent.setState(() {
        //   widget.parent.checkResult();
        // });
        if (!selected) {
          // setState(() {
          //   print("--------START----------");
          //   roundPairs[widget.tileIndex].setIsSelected(true);
          // });
          if (selectedImageAssetPath != []) {
            selectedImageAssetPath.add(widget.imageAssetPath);
            card++;
            print("selectedImageAssetPath: $selectedImageAssetPath");
            contain = remain.where((element) =>
                element.imageAssetPath == selectedImageAssetPath[0]);
            if (contain.isEmpty) {
              // Value not exist
              print("Not check");
            } else {
              // Value exist
              print("Check here");
              if (levels <= 4) {
                // Check answer
                if (selectedImageAssetPath[0] ==
                    visiblePairs[0].imageAssetPath) {
                  // Correct
                  print("Correct");
                  setState(() {
                    score += 200;
                  });
                  widget.parent.setState(() {
                    widget.parent.showCorrect();
                    levels++;
                    widget.parent.countdownTimer!.cancel();
                    widget.parent.timerDuration = Duration(seconds: 10);

                    // widget.parent.start();
                    widget.parent._isLoading();
                  });
                } else {
                  // Wrong
                  print("wrong");
                  // widget.parent.showWrong();
                  widget.parent.setState(() {
                    widget.parent.showWrong();
                    levels++;
                    widget.parent.countdownTimer!.cancel();
                    widget.parent.timerDuration = Duration(seconds: 10);
                    // widget.parent.start();
                    widget.parent._isLoading();
                  });
                }
              } else if (levels <= 8) {
                if (selectedImageAssetPath[0] ==
                        visiblePairs[0].imageAssetPath ||
                    selectedImageAssetPath[0] ==
                        visiblePairs[1].imageAssetPath) {
                  // Correct
                  print("correct");
                  setState(() {
                    score += 200;
                  });
                  widget.parent.setState(() {
                    widget.parent.showCorrect();
                  });

                  selectedImageAssetPath = [];
                } else {
                  // Wrong
                  print("wrong");
                  widget.parent.setState(() {
                    widget.parent.showWrong();
                  });
                }
                selectedImageAssetPath = [];

                if (card <= 2) {
                } else {
                  //End
                  print("end");
                  widget.parent.setState(() {
                    levels++;
                    widget.parent.countdownTimer!.cancel();
                    widget.parent.timerDuration = Duration(seconds: 15);
                    // widget.parent.start();
                    widget.parent._isLoading();
                  });
                }
              } else if (levels <= 10) {
                if (selectedImageAssetPath[0] ==
                        visiblePairs[0].imageAssetPath ||
                    selectedImageAssetPath[0] ==
                        visiblePairs[1].imageAssetPath ||
                    selectedImageAssetPath[0] ==
                        visiblePairs[2].imageAssetPath) {
                  // Correct
                  print("correct");
                  setState(() {
                    score += 200;
                  });
                  widget.parent.setState(() {
                    widget.parent.showCorrect();
                  });
                } else {
                  // Wrong
                  print("wrong");
                  widget.parent.setState(() {
                    widget.parent.showWrong();
                  });
                }
                selectedImageAssetPath = [];

                if (card <= 3) {
                } else {
                  //End
                  print("end");
                  widget.parent.setState(() {
                    levels++;
                    widget.parent.countdownTimer!.cancel();
                    widget.parent.timerDuration = Duration(seconds: 20);
                    // widget.parent.start();
                    widget.parent._isLoading();

                    // widget.parent.endGame();
                  });
                }
                if (levels > 10) {
                  widget.parent.setState(() {
                    levels = 10;
                    widget.parent.endGame();
                    widget.parent.countdownTimer!.cancel();
                  });
                }
              } else {
                print("Dont inscrease");
              }
            }

            selectedImageAssetPath = [];
          } else {
            print("Here");
          }
          print("---------------------");
          print(pairs[widget.tileIndex].getIsSelected());
          print("You click me");
          print("responseTime: $responseTime");
          argTime = score / responseTime;
          bonusScore = score / argTime;
          totalScore = score + bonusScore;
          print(widget.imageAssetPath);
        }
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: Card(
          elevation: 10,
          child: Center(
            child: Image.asset(widget.imageAssetPath),
          ),
        ),
      ),
    );
  }
}
