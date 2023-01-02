import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:brain_train_memory/result_screen_m2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'data/data_memory_two.dart';

class MemoryTwoScreen extends StatefulWidget {
  const MemoryTwoScreen({super.key});

  @override
  State<MemoryTwoScreen> createState() => _MemoryTwoScreenState();
}

class _MemoryTwoScreenState extends State<MemoryTwoScreen> {
  // Popup after each tries
  Future<void> _showNotify(String title, String content, String contents,
      String img, Function callback) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => Container(
        padding: const EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            //Alignment at Center
            Positioned(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 350,
                      height: 220,
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
                      // left: 0,
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
                      bottom: 10,
                      child: Align(
                        child: SizedBox(
                          width: 350,
                          height: 40,
                          child: Center(
                            child: AutoSizeText(
                              content,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.black,
                                wordSpacing: 2,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Button
                  ],
                ),
              ),
            ),
            Positioned(
              top: 580,
              child: SizedBox(
                height: 40,
                width: 330,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xfff49d1a),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: () => callback(),
                    child: Text(
                      contents,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void winGame() {
    _showNotify("Điểm: $score", "Số hình đúng: $numOfCard", "Tiếp tục",
        'assets/medal.png', () {
      Navigator.of(context).pop();
      setState(() {
        level++;
        start();
      });
    });
  }

  // void showCorrect() => Fluttertoast.showToast(
  //     msg: "Chính xác: +200",
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.TOP,
  //     timeInSecForIosWeb: 1,
  //     backgroundColor: Colors.green,
  //     textColor: Colors.white,
  //     fontSize: 16.0);
  void showCorrect() {
    Fluttertoast.cancel();
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

  void next() {
    showCorrect();
    remain = getImg + pickRandomItemsAsListWithSubList(pairs, 1);
    pairs.removeWhere((element) => remain.contains(element));
    getImg = remain;
    getImg.shuffle();
    tries++;
    returnColumn();
  }

  void endGame() {
    _showNotify("Điểm: $score", "Số hình đúng: $numOfCard", "Tiếp tục",
        "assets/correct.png", () {
      Navigator.of(context).pop();
      setState(() {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultMemoryTwo(),
            ));
      });
    });
  }

  int columns = 0;
  void start() {
    tries = 0;
    score = 0;
    numOfCard = 0;
    // pairs = getPairs_4();
    // getImg = pairs;
    getImg = pickRandomItemsAsListWithSubList(pairs, 3);
    pairs.removeWhere((element) => getImg.contains(element));
    returnColumn();
  }

  // 15 Img = 3 Column
  // 16 Img - 28 Img = 4 column
  // 29 Img - 50 Img = 5 column
  returnColumn() {
    if (getImg.length <= 15) {
      columns = 3;
    } else if (getImg.length <= 28) {
      columns = 4;
    } else if (getImg.length <= 50) {
      columns = 5;
    }
    return columns;
  }

  @override
  void initState() {
    // TODO: implement initState
    pairs = listOfList[Random().nextInt(4)];
    start();
    super.initState();
  }

  final double runSpacing = 10;
  final double spacing = 4;

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
              Expanded(
                child: Container(
                  // decoration: BoxDecoration(color: Colors.amber),
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          "Lượt chơi:",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "$level/3",
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Center(
                  child: Container(
                    // decoration: BoxDecoration(color: Colors.blue),
                    child: Wrap(
                      runSpacing: runSpacing,
                      spacing: spacing,
                      alignment: WrapAlignment.center,
                      children: List.generate(getImg.length, (index) {
                        return Container(
                          width: w,
                          height: w,
                          child: Tile(
                              imageAssetPath: getImg[index].getImageAssetPath(),
                              tileIndex: index,
                              parent: this),
                        );
                      }),
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
  _MemoryTwoScreenState parent;
  Tile({
    required this.imageAssetPath,
    required this.tileIndex,
    required this.parent,
  });
  // const Tile({super.key});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("------------");
        if (!selected) {
          // setState(() {
          //   pairs[widget.tileIndex].setIsSelected(true);
          // });

          checkString = selectedImageAssetPath.where((element) =>
              element == getImg[widget.tileIndex].getImageAssetPath());

          if (checkString.isEmpty) {
            // Correct
            print("Value not exists");
            print(getImg[widget.tileIndex].getImageAssetPath());
            // selectedTileIndex.add(widget.tileIndex);
            selectedImageAssetPath
                .add(getImg[widget.tileIndex].getImageAssetPath());

            // if pairs = 8 then selectedImageAssetPath.length = pairs - 2
            if (selectedImageAssetPath.length == 48) {
              print("Stop here");
              selectedImageAssetPath = [];
              // setState(() {
              //   score = 0;
              // });
              widget.parent.setState(() {
                // widget.parent.start();
                if (level == 1) {
                  bonus = numOfCard * 100;
                } else if (level == 2) {
                  bonus = numOfCard * 200;
                } else if (level == 3) {
                  bonus = numOfCard * 300;
                }
                widget.parent.winGame();
                if (level == 1) {
                  numOfCard_1 = numOfCard;
                } else if (level == 2) {
                  numOfCard_2 = numOfCard;
                } else if (level == 3) {
                  numOfCard_3 = numOfCard;
                }
              });
            } else {
              setState(() {
                score += 500;
                numOfCard++;
              });
              widget.parent.setState(() {
                // widget.parent.showCorrect();
                widget.parent.next();
              });
            }
          } else {
            // Wrong
            print("Value exists");
            selectedImageAssetPath = [];

            widget.parent.setState(() {
              // widget.parent.start();
              if (level == 1) {
                bonus = numOfCard * 100;
              } else if (level == 2) {
                bonus = numOfCard * 200;
              } else if (level == 3) {
                bonus = numOfCard * 300;
              }
              widget.parent.winGame();

              if (level == 1) {
                numOfCard_1 = numOfCard;
              } else if (level == 2) {
                numOfCard_2 = numOfCard;
              } else if (level == 3) {
                numOfCard_3 = numOfCard;
              }
            });
            if (level < 3) {
            } else {
              numOfCard = numOfCard_1 + numOfCard_2 + numOfCard_3;
              score = numOfCard_1 * 600 + numOfCard_2 * 700 + numOfCard_3 * 800;
              widget.parent.setState(() {
                widget.parent.endGame();
              });
            }
          }

          // print(selectedTileIndex);
          print("bounus: $bonus");
          print(selectedImageAssetPath);
          print("You click me");
        }
      },
      child: Container(
        // margin: EdgeInsets.all(10),
        child: Card(
          elevation: 10,
          child: Image.asset(
            widget.imageAssetPath,
          ),
        ),
      ),
    );
  }
}
