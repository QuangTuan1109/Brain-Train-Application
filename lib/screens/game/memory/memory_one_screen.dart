import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_application_1/data/data_memory/data_memory_one.dart';
import 'package:flutter_application_1/screens/game/memory/test_screen.dart';
import 'package:flutter_application_1/widgets/components/score_board.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemoryOneScreen extends StatefulWidget {
  const MemoryOneScreen({super.key});

  @override
  State<MemoryOneScreen> createState() => _MemoryOneScreenState();
}

class _MemoryOneScreenState extends State<MemoryOneScreen> {
  bool init = false; // Biến dùng để hiện thời gian 3s
  int numOfRow = 0; // Số card trên môt hàng
  int highlight = 0;

  // Time 1: Thời gian 3s để chuẩn bị
  int percent = 3;
  Timer? timer;
  displayTimer() {
    timer = Timer.periodic(Duration(milliseconds: 1000), (_) {
      setState(() {
        percent -= 1;
        if (percent <= 0) {
          init = true;
          timer!.cancel();
          displayTimer2();
        }
      });
    });
  }

  cardOfLevel(numOfY, numOfW) {
    pairsYellow = getYellow();
    pairsWhite = getWhite();
    total = numOfY + numOfW;
    pairs = pickRandomItemsAsListWithSubList(pairsYellow, numOfY) +
        pickRandomItemsAsListWithSubList(pairsWhite, numOfW);
    visiblePairs = pickRandomItemsAsListWithSubList(pairsWhite, total);
    selected = true;
    Future.delayed(Duration(seconds: 3), () {
      pairs.shuffle();
      visiblePairs = pairs;
      selected = true;

      // Sau 3 giây thì tắt Highlight ()

      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          selected = false;
          visiblePairs = pickRandomItemsAsListWithSubList(pairsWhite, total);
          timerDuration = Duration(seconds: 10);
          startTimer();
        });
      });
    });
  }

  // Time 2: Thời gian 3s để highlight
  int percent2 = 3;
  Timer? timer2;
  displayTimer2() {
    timer2 = Timer.periodic(Duration(milliseconds: 1000), (_) {
      setState(() {
        percent2 -= 1;
        if (percent2 <= 0) {
          init = true;
          timer2!.cancel();
          percent = 0;
        }
      });
    });
  }

  // Time 3: Thời gian 10s để chơi game
  Duration timerDuration = const Duration(seconds: 10);
  void setCountdown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = timerDuration.inSeconds - reduceSecondsBy;
      if (seconds <= 0) {
        countdownTimer!.cancel();
        numOfChoose = 0;
        init = false;
        timerDuration = const Duration(seconds: 10);
        restart();
      } else {
        timerDuration = Duration(seconds: seconds);
      }
    });
  }

  Timer? countdownTimer;
  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountdown());
  }

  //
  displayLevel() {
    if (level == 1) {
      // 2x3
      cardOfLevel(1, 5);
      numOfRow = 3;
      highlight = level;
    } else if (level == 2) {
      // 3x3
      cardOfLevel(2, 7);
      numOfRow = 3;
      highlight = level;
    } else if (level == 3) {
      // 3x4
      cardOfLevel(3, 9);
      numOfRow = 4;
      highlight = level;
    } else if (level == 4) {
      // 4x4
      cardOfLevel(4, 12);
      numOfRow = 4;
      highlight = level;
    } else if (level == 5) {
      // 4x5
      cardOfLevel(5, 15);
      numOfRow = 5;
      highlight = level;
    } else if (level == 6) {
      // 4x5
      cardOfLevel(6, 14);
      numOfRow = 5;
      highlight = level;
    } else if (level == 7) {
      // 5x5
      cardOfLevel(7, 18);
      numOfRow = 5;
      highlight = level;
    } else if (level == 8) {
      // 5x6
      cardOfLevel(8, 22);
      numOfRow = 6;
      highlight = level;
    } else if (level == 9) {
      // 5x6
      cardOfLevel(9, 21);
      numOfRow = 6;
      highlight = level;
    } else if (level == 10) {
      // 6x6
      cardOfLevel(10, 26);
      numOfRow = 6;
      highlight = level;
    } else if (level == 11) {
      // 6x7
      cardOfLevel(11, 31);
      numOfRow = 7;
      highlight = level;
    } else if (level == 12) {
      // 6x7
      cardOfLevel(12, 30);
      numOfRow = 7;
      highlight = level;
    } else if (level == 13) {
      // 7x7
      cardOfLevel(13, 36);
      numOfRow = 7;
      highlight = level;
    } else if (level == 14) {
      // 7x7
      cardOfLevel(14, 35);
      numOfRow = 7;
      highlight = level;
    } else if (level == 15) {
      // 7x8
      cardOfLevel(15, 41);
      numOfRow = 8;
      highlight = level;
    } else if (level == 16) {
      // 7x8
      cardOfLevel(16, 40);
      numOfRow = 8;
      highlight = level;
    } else if (level == 17) {
      // 8x8
      cardOfLevel(17, 47);
      numOfRow = 8;
      highlight = level;
    } else if (level == 18) {
      // 8x8
      cardOfLevel(18, 46);
      numOfRow = 8;
      highlight = level;
    } else if (level == 19) {
      // 8x8
      cardOfLevel(19, 45);
      numOfRow = 8;
      highlight = level;
    } else if (level == 20) {
      // 8x9
      cardOfLevel(20, 52);
      numOfRow = 9;
      highlight = level;
    } else if (level == 21) {
      // 8x9
      cardOfLevel(21, 51);
      numOfRow = 9;
      highlight = level;
    } else if (level == 22) {
      // 9x9
      cardOfLevel(22, 59);
      numOfRow = 9;
      highlight = level;
    } else if (level == 23) {
      // 9x9
      cardOfLevel(23, 58);
      numOfRow = 9;
      highlight = level;
    } else if (level == 24) {
      // 9x9
      cardOfLevel(24, 57);
      numOfRow = 9;
      highlight = level;
    } else if (level == 25) {
      // 9x10
      cardOfLevel(25, 65);
      numOfRow = 10;
      highlight = level;
    } else if (level == 26) {
      // 9x10
      cardOfLevel(26, 64);
      numOfRow = 10;
      highlight = level;
    } else if (level == 27) {
      // 9x10
      cardOfLevel(27, 63);
      numOfRow = 10;
      highlight = level;
    } else if (level == 28) {
      // 10x10
      cardOfLevel(28, 72);
      numOfRow = 10;
      highlight = level;
    } else if (level == 29) {
      // 10x10
      cardOfLevel(29, 71);
      numOfRow = 10;
      highlight = level;
    } else if (level == 30) {
      // 10x10
      cardOfLevel(30, 70);
      numOfRow = 10;
      highlight = level;
    }
  }

  // Khởi tạo level ban đầu
  initGame() {
    if (maxLevel <= 1) {
      level = 1;
    } else {
      level = maxLevel ~/ 2;
    }
  }

// Save maxLevel
  Future<void> setMaxLevel() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("dataMaxLevel", maxLevel);
  }

  // xác định level trong hàm Reset()
  calLevel() {
    if (numOfWrong == 0) {
      // Level up
      level += 1;
    } else {
      // Level down
      level -= numOfWrong ~/ 2;
    }
    restart();
  }

  void restart() {
    numOfChoose = 0;
    level;
    percent = 3;
    displayTimer();
    displayLevel();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tries = 1;
    initGame();
    maxLevel = level;
    numOfChoose = 0;
    restart();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    countdownTimer!.cancel();
    timer!.cancel();
    timer2!.cancel();
    super.dispose();
  }

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
                  Positioned(
                    left: 0,
                    bottom: 45,
                    child: Column(
                      children: [
                        Text(
                          "Điểm số: $score",
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            wordSpacing: 2,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Cấp độ cao nhất của bạn: $maxLevel",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  decoration: TextDecoration.none,
                                  color: Colors.black.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Button

                  Positioned(
                    left: 115,
                    bottom: 5,
                    child: SizedBox(
                      height: 40,
                      width: 120,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff277bc0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          onPressed: () => callback(),
                          child: Text(
                            contents,
                            style: const TextStyle(
                              color: Colors.white,
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
    _showNotify("Hoàn Thành", "", "Thoát", "assets/correct.png", () {
      Navigator.of(context).pop();
      setState(() {
        Navigator.pop(context, back);
      });
    });
  }

  bool back = false;

  Future<bool?> showMyDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bạn có muốn thoát ra ?'),
          actions: [
            TextButton(
              child: Text('Không'),
              onPressed: () {
                back = false;
                Navigator.pop(context, back);
              },
            ),
            TextButton(
              child: Text('Có'),
              onPressed: () {
                back = true;
                Navigator.pop(context, back);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    return WillPopScope(
        onWillPop: () async {
          final back = await showMyDialog(context);
          return back ?? false;
        },
        child: SafeArea(
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
                    // width: screen_width,
                    // height: screen_height / 4.5,
                    // decoration: const BoxDecoration(
                    //   color: Colors.amber,
                    // ),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "Cấp độ: $level",
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            "Lượt chơi: $tries/12",
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xffbbe3f0),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            scoreBoard(
                                "Thời gian", "${timerDuration.inSeconds}"),
                            scoreBoard("Điểm", "0"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Display Question
                  Expanded(
                    flex: 1,
                    child: Container(
                      // decoration: BoxDecoration(color: Colors.blue),
                      child: init == false
                          ? Container(
                              child: CircularPercentIndicator(
                                circularStrokeCap: CircularStrokeCap.round,
                                percent: percent / 3,
                                animation: true,
                                animateFromLastPercent: true,
                                radius: 30.0,
                                lineWidth: 5.0,
                                progressColor: Colors.amber,
                                center: Text(
                                  "$percent",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 40),
                                ),
                              ),
                            )
                          : Container(),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      // decoration: BoxDecoration(color: Colors.deepOrange),
                      child: GridView(
                        padding: EdgeInsets.only(
                            top: 10, left: 20, right: 20, bottom: 10),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: numOfRow),
                        children: List.generate(visiblePairs.length, (index) {
                          return Tile(
                              imageAssetPath:
                                  visiblePairs[index].getImageAssetPath(),
                              parent: this,
                              tileIndex: index);
                        }),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class Tile extends StatefulWidget {
  String imageAssetPath;
  int tileIndex;
  _MemoryOneScreenState parent;
  Tile({
    required this.imageAssetPath,
    required this.parent,
    required this.tileIndex,
  });

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          print("------------------");
          if (selectedImageAssetPath == '') {
            selectedTileIndex = widget.tileIndex;
            selectedImageAssetPath =
                pairs[widget.tileIndex].getImageAssetPath();
            print(selectedTileIndex);
            print(selectedImageAssetPath);
            setState(() {
              numOfChoose++;
            });
            print("hightLight ${widget.parent.highlight}");

            if (numOfChoose <= widget.parent.highlight) {
              // continue
              if (selectedImageAssetPath == "assets/yellow.png") {
                //Correct
                print("Correct");
                selected = true;
                Future.delayed(Duration(milliseconds: 300), () {
                  selected = false;
                  score += 200;
                });
                // numOfCorrect += 1;
              } else {
                // Wrong
                print("Wrong");
                selected = true;
                Future.delayed(Duration(milliseconds: 300), () {
                  selected = false;
                });
                numOfWrong += 1;
              }
              selectedImageAssetPath = '';
              // Đếm số card đã chọn cho mỗi level
              if (numOfChoose == widget.parent.highlight) {
                print("End Game");

                if (tries < 12) {
                  print("Level đã tăng: $level");
                  print("tries: $tries");
                  // Xử lý tăng giảm Level

                  if (numOfWrong == 0) {
                    //  selected = true;
                    // Level up
                    print("Level up");
                    score += 100 * level;
                    level += 1;

                    Future.delayed(Duration(milliseconds: 300), () {
                      setState(() {
                        tries++;
                      });
                      widget.parent.setState(() {
                        widget.parent.countdownTimer!.cancel();

                        widget.parent.init = false;
                        widget.parent.timerDuration =
                            const Duration(seconds: 10);
                        widget.parent.restart();
                      });
                    });
                  } else {
                    level -= numOfWrong ~/ 2;
                    print("Level đã tăng: $level");

                    Future.delayed(Duration(milliseconds: 300), () {
                      setState(() {
                        numOfWrong = 0;
                        tries++;
                      });
                      widget.parent.setState(() {
                        widget.parent.countdownTimer!.cancel();
                        widget.parent.init = false;
                        widget.parent.timerDuration =
                            const Duration(seconds: 10);
                        widget.parent.restart();
                      });
                    });
                  }
                  if (maxLevel < level) {
                    maxLevel = level;
                  }
                } else {
                  widget.parent.setState(() {
                    widget.parent.endGame();
                    widget.parent.setMaxLevel();
                  });
                }
              }
            }
          }

          setState(() {
            pairs[widget.tileIndex].setIsSelected(true);
          });
          print("maxLevel: $maxLevel");
          print("level: $level");
          print("numOfChoose $numOfChoose");
          print("numOfWrong $numOfWrong");
          print("Click me");
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 10,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(pairs[widget.tileIndex].getIsSelected()
                ? pairs[widget.tileIndex].getImageAssetPath() ==
                        "assets/yellow.png"
                    ? pairs[widget.tileIndex].getImageAssetPath()
                    : "assets/grey.png"
                : widget.imageAssetPath),
          ),
        ),
      ),
    );
  }
}
