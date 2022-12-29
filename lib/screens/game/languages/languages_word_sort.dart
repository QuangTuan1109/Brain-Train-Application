import 'dart:math';
import 'package:flutter_application_1/data/data_language/list_question_four.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme_color/light_colors.dart';
import 'package:flutter_application_1/values/share_data.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:word_search/word_search.dart';

import '../../../data/data_onborad/data_languages_4.dart';

class WordFind extends StatefulWidget {
  const WordFind({Key? key}) : super(key: key);

  @override
  _WordFindState createState() => _WordFindState();
}

class _WordFindState extends State<WordFind> {
  // sent size to our widget
  GlobalKey<_WordFindWidgetState> globalKey = GlobalKey();

  // make list question for puzzle
  // make class 1st

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.green,
          child: Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      color: Colors.black,
                      // lets make our word find widget
                      // sent list to our widget
                      child: WordFindWidget(
                        constraints.biggest,
                        listQuestions.map((ques) => ques.clone()).toList(),
                        key: globalKey,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// make statefull widget name WordFindWidget
class WordFindWidget extends StatefulWidget {
  Size size;
  List<WordFindQues> listQuestions;
  WordFindWidget(this.size, this.listQuestions, {required Key key})
      : super(key: key);

  @override
  _WordFindWidgetState createState() => _WordFindWidgetState();
}

class _WordFindWidgetState extends State<WordFindWidget> {
  late Size size;
  late SharedPreferences prefs;
  late List<WordFindQues> listQuestions;
  int indexQues = 0; // current index question
  int hintCount = 0;
  List bao = [0, 1, 2, 3, 4];
  int count = 0;
  var i = 0;
  int best = 0;
  int count2 = 3;
  var nextcount = 0;
  bool back = false;
  // thanks for watching.. :)

  // setLevel2() async {
  //   // for (var i = 0; i < count2; i++) {
  //   //   indexQues++;
  //   for (count; count < 10; count++) {
  //     generateHint();
  //   }
  //   // }
  //   ;
  // }

  @override
  void initState() {
    super.initState();

    size = widget.size;
    listQuestions = widget.listQuestions;
    getLevel();
    // setLevel();
    // setLevel2();

    // indexQues;
    generateHint();
    generatePuzzle();
    // generateHintAll();
    // setLevel();
    // setLevel3();
  }

  getLevel() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    // int value = prefs.getInt(ShareData.counter) ?? 0;
    // final prefs = await SharedPreferences.getInstance();
    int level = prefs.getInt(ShareData.level) ?? 0;

    setState(() {
      best = level.toInt();
      indexQues = level.toInt();
      size = widget.size;
      // listQuestions = value.toString() as List<WordFindQues>;
      generatePuzzle();
    });
  }

  @override
  void dispose() {
    super.dispose();
    // listQuestions = widget.listQuestions;
    // getLevel();
    // size = widget.size;
    // generateHint();
  }

  // setLevel() {
  //   for (var i = 0; i < 55; i++) {
  //     if (i == 5) {
  //       indexQues = 2;
  //       // setLevel2();
  //     }
  //     if (i == 7) {
  //       indexQues++; // jump to next iteration
  //     }
  //     if (i == 10) {
  //       break; // stop loop immediately
  //     }
  //     print(i);
  //   }
  //   // for (i; i < 1; i++);
  //   // {
  //   //   // if (i == 2) {
  //   //   indexQues++;
  //   //   // }
  //   //   print("b${i}");
  //   // }
  //   print("c${indexQues}");

  //   setState(() {
  //     // indexQues;
  //     generatePuzzle();
  //   });
  //   setLevel2();

  //   // setLevel2();
  // }

  Future<bool?> showMyDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bạn có muốn thoát ra ?'),
          actions: [
            TextButton(
              child: Text('Không'),
              onPressed: () async {
                back = false;
                Navigator.pop(context, back);
                // Obtain shared preferences.
              },
            ),
            TextButton(
              child: Text('Có'),
              onPressed: () async {
                back = true;
                Navigator.pop(context, back);
                final prefs = await SharedPreferences.getInstance();
                await prefs.setInt(ShareData.counter, indexQues.toInt());

                // await prefs.setString(
                //     ShareData.counter, listQuestions.toString());
                print(indexQues);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _dialogBuilderTwo(BuildContext context) {
    final obController = OnBoardingLanguageFour();
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () async {
          // final back = await showMyDialog(context);
          return false;
        },
        child: Scaffold(
          body: Stack(
            alignment: Alignment.center,
            children: [
              LiquidSwipe(
                pages: obController.pages,
                enableSideReveal: true,
                liquidController: obController.controller,
                onPageChangeCallback: obController.onPageChangedCallback,
                slideIconWidget: const Icon(Icons.arrow_back_ios),
                waveType: WaveType.liquidReveal,
              ),
              Positioned(
                top: 50,
                right: 20,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:
                      const Text("Skip", style: TextStyle(color: Colors.grey)),
                ),
              ),
              Obx(
                () => Positioned(
                  bottom: 10,
                  child: AnimatedSmoothIndicator(
                    count: 6,
                    activeIndex: obController.currentPage.value,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Color(0xff272727),
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

  @override
  Widget build(BuildContext context) {
    // lets make ui
    // let put current data on question
    WordFindQues currentQues = listQuestions[indexQues];
    var ColorsHint;
    var test = int.parse(currentQues.count);
    if (count2 > 1) {
      ColorsHint = Colors.yellow[900];
    } else {
      ColorsHint = LightColors.kLightYellow;
    }
    ;
    // ignore: unnecessary_type_check
    assert(test is int);
    return WillPopScope(
      onWillPop: () async {
        final back = await showMyDialog(context);
        return back ?? false;
      },
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: LightColors.kLightYellow,
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              const Positioned(
                left: -5,
                right: -230,
                child: Image(
                  image: AssetImage('assets/images/cat-sleep.gif'),
                  height: 200,
                  width: 400,
                  //   width:400,
                ),
              ),
              Column(
                children: [
                  Container(
                    // margin: const EdgeInsets.all(16),
                    height: 500,
                    padding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 16),
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
                      body: Container(
                        child: Center(
                          child: Column(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 2),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 10),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () async {
                                                      final back =
                                                          await showMyDialog(
                                                              context);
                                                      if (back == true) {
                                                        Navigator.pop(
                                                            context, back);
                                                      }
                                                    },
                                                    icon: const Icon(
                                                      Icons
                                                          .arrow_circle_left_outlined,
                                                      size: 40,
                                                    ),
                                                    color: Colors.black,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      _dialogBuilderTwo(
                                                          context);
                                                    },
                                                    icon: const Icon(
                                                      Icons
                                                          .question_mark_rounded,
                                                      size: 35,
                                                    ),
                                                    color: Colors.black,
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      _dialogBuilderTwo(
                                                          context);
                                                    },
                                                    icon: const Icon(
                                                      Icons.settings,
                                                      size: 35,
                                                    ),
                                                    color: Colors.black,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Container(
                                          margin: const EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                            left: 5,
                                            right: 5,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6, horizontal: 22),
                                          height: 380,
                                          decoration: BoxDecoration(
                                            color: LightColors.kLightYellow,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                          onTap: () async {
                                                            if (count2 > 1) {
                                                              generateHint();
                                                            }
                                                            ;
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .tungsten_outlined,
                                                            size: 45,
                                                            color: ColorsHint,
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            currentQues.isDone =
                                                                false;
                                                            for (var i = 0;
                                                                i < 4;
                                                                i++) {
                                                              generatePuzzle(
                                                                  next: true);
                                                            }

                                                            currentQues.isFull =
                                                                false;
                                                          },
                                                          child: Icon(
                                                            Icons.sync_outlined,
                                                            size: 45,
                                                            color: Colors
                                                                .yellow[900],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                          onLongPress: () {
                                                            generatePuzzle(
                                                                left: true);
                                                            generateHintAll();
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .arrow_back_ios,
                                                            size: 45,
                                                            color: Colors
                                                                .yellow[900],
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onLongPress:
                                                              () async {
                                                            generatePuzzle(
                                                                next: true);
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .arrow_forward_ios,
                                                            size: 45,
                                                            color: Colors
                                                                .yellow[900],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                margin: EdgeInsets.fromLTRB(
                                                    20, 55, 30, 10),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  "${currentQues.question ?? ''}",
                                                  style: const TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 30,
                                                    horizontal: 0),
                                                alignment: Alignment.center,
                                                child: LayoutBuilder(
                                                  builder:
                                                      (context, constraints) {
                                                    return Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: currentQues
                                                          .puzzles
                                                          .map((puzzle) {
                                                        // later change color based condition
                                                        Color? color;

                                                        if (currentQues.isDone)
                                                          color =
                                                              Colors.green[600];
                                                        else if (puzzle
                                                            .hintShow) {
                                                          color =
                                                              Colors.green[600];
                                                        } else if (currentQues
                                                            .isFull) {
                                                          color = Colors.red;
                                                        } else {
                                                          color = LightColors
                                                              .kLightYellow2;
                                                        }

                                                        return InkWell(
                                                          onTap: () {
                                                            if (puzzle
                                                                    .hintShow ||
                                                                currentQues
                                                                    .isDone)
                                                              return;
                                                            currentQues.isFull =
                                                                false;
                                                            // currentQues.isDone = false;
                                                            puzzle.clearValue();
                                                            setState(() {});
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: color,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            width: constraints
                                                                        .biggest
                                                                        .width /
                                                                    test -
                                                                6,
                                                            height: constraints
                                                                    .biggest
                                                                    .width /
                                                                8,
                                                            margin:
                                                                EdgeInsets.all(
                                                                    3),
                                                            child: Text(
                                                              "${puzzle.currentValue ?? ''}"
                                                                  .toUpperCase(),
                                                              style: TextStyle(
                                                                fontSize: 25,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }).toList(),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
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
                  const SizedBox(height: 50),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1,
                            crossAxisCount: 5,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 4,
                          ),
                          itemCount: test, // later change
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            bool statusBtn = currentQues.puzzles.indexWhere(
                                    (puzzle) => puzzle.currentIndex == index) >=
                                0;

                            return LayoutBuilder(
                              builder: (context, constraints) {
                                Color color = statusBtn
                                    ? Color(0xFFFFD600)
                                    : Color(0xFFFFFD9D);

                                return Container(
                                  decoration: BoxDecoration(
                                    color: color,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  // margin: ,
                                  alignment: Alignment.center,
                                  child: TextButton(
                                    // height: constraints.biggest.height,
                                    child: Text(
                                      "${currentQues.arrayBtns[index]}"
                                          .toUpperCase(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {
                                      if (!statusBtn) setBtnClick(index);
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
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

  Future<void> generatePuzzle({
    List<WordFindQues>? loop,
    bool next: false,
    bool left: false,
  }) async {
    nextcount = 0;
    count2 = 3;

    // lets finish up generate puzzle
    if (loop != null) {
      indexQues = 0;
      this.listQuestions = <WordFindQues>[];
      this.listQuestions.addAll(loop);
    } else {
      if (next &&
          listQuestions[indexQues].isDone &&
          indexQues < listQuestions.length - 1) {
        nextcount++;
        await Future.delayed(Duration(seconds: 1));
        indexQues++;

        if (indexQues != 0 &&
            indexQues > best &&
            indexQues < listQuestions.length - 1) {
          best++;
        }

        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt(ShareData.level, best.toInt());

        print("bao${best}");
      } else if (left && indexQues != 0) {
        // setLevel2();
        indexQues--;
      } else if (indexQues >= listQuestions.length - 1) return;

      setState(() {});

      if (this.listQuestions[indexQues].isDone) {
        return;
      }
    }

    WordFindQues currentQues = listQuestions[indexQues];

    setState(() {});

    final List<String> wl = [currentQues.shuffled];
    var test = int.parse(currentQues.count);
    assert(test is int);
    final WSSettings ws = WSSettings(
      width: test, // total random word row we want use
      height: 1,
      orientations: List.from([
        WSOrientation.horizontal,
      ]),
    );

    final WordSearch wordSearch = WordSearch();

    final WSNewPuzzle newPuzzle = wordSearch.newPuzzle(wl, ws);

    // check if got error generate random word
    if (newPuzzle.errors.isEmpty) {
      currentQues.arrayBtns = newPuzzle.puzzle.expand((list) => list).toList();

      bool isDone = currentQues.isDone;

      if (!isDone) {
        currentQues.puzzles = List.generate(wl[0].split("").length, (index) {
          return WordFindChar(
              correctValue: currentQues.answer.split("")[index]);
        });
      }
    }

    hintCount = 0; //number hint per ques we hit
    setState(() {});
  }

  generateHint() async {
    // let dclare hint
    WordFindQues currentQues = listQuestions[indexQues];

    // var currentQues;
    List<WordFindChar> puzzleNoHints = currentQues.puzzles
        .where((puzzle) => !puzzle.hintShow && puzzle.currentIndex == null)
        .toList();

    if (puzzleNoHints.length > 0 && count2 > 0) {
      hintCount++;
      int indexHint = Random().nextInt(puzzleNoHints.length);
      int countTemp = 0;
      // print("hint $indexHint");

      currentQues.puzzles = currentQues.puzzles.map((puzzle) {
        if (!puzzle.hintShow && puzzle.currentIndex == null) countTemp++;

        if (indexHint == countTemp - 1) {
          puzzle.hintShow = true;
          puzzle.currentValue = puzzle.correctValue;
          count2--;
          puzzle.currentIndex = currentQues.arrayBtns
              .indexWhere((btn) => btn == puzzle.correctValue);
        }

        return puzzle;
      }).toList();

      // check if complete

      if (await currentQues.fieldCompleteCorrect()) {
        currentQues.isDone = true;

        setState(() {});

        await Future.delayed(Duration(seconds: 1));
        generatePuzzle(next: true);
      }

      // my wrong..not refresh.. damn..haha
      setState(() {});
    }
  }

  generateHintAll() async {
    // let dclare hint
    WordFindQues currentQues = listQuestions[indexQues];

    List<WordFindChar> puzzleNoHints = currentQues.puzzles
        .where((puzzle) => !puzzle.hintShow && puzzle.currentIndex == null)
        .toList();
    print(puzzleNoHints.length);
    for (var i = 0; i <= puzzleNoHints.length; i++) {
      if (puzzleNoHints.length > 0) {
        hintCount++;
        // int indexHint;
        // for (var i = 0; i <= 10; i++) {

        int indexHint = 0;

        int countTemp = 0;
        // print("hint $indexHint");

        currentQues.puzzles = currentQues.puzzles.map((puzzle) {
          if (!puzzle.hintShow && puzzle.currentIndex == null) countTemp++;

          if (indexHint == countTemp - 1) {
            puzzle.hintShow = true;
            puzzle.currentValue = puzzle.correctValue;
            puzzle.currentIndex = currentQues.arrayBtns
                .indexWhere((btn) => btn == puzzle.correctValue);
          }

          return puzzle;
        }).toList();
        indexHint++;
        // check if complete

        if (await currentQues.fieldCompleteCorrect()) {
          currentQues.isDone = true;

          // setState(() {});

          // await Future.delayed(Duration(seconds: 1));
          // generatePuzzle(next: true);
        }

        // my wrong..not refresh.. damn..haha
        setState(() {});
        // }
      }
    }
  }

  Future<void> setBtnClick(int index) async {
    WordFindQues currentQues = listQuestions[indexQues];

    int currentIndexEmpty =
        currentQues.puzzles.indexWhere((puzzle) => puzzle.currentValue == null);

    if (currentIndexEmpty >= 0) {
      currentQues.puzzles[currentIndexEmpty].currentIndex = index;
      currentQues.puzzles[currentIndexEmpty].currentValue =
          currentQues.arrayBtns[index];

      if (await currentQues.fieldCompleteCorrect()) {
        currentQues.isDone = true;

        setState(() {});

        await Future.delayed(Duration(seconds: 1));
        generatePuzzle(next: true);
      }
      setState(() {});
    }
  }
}

class WordFindQues {
  var question;
  var shuffled;
  var count;
  var answer;
  bool isDone = false;
  bool isFull = false;
  List<WordFindChar> puzzles = <WordFindChar>[];
  List<String> arrayBtns = <String>[];

  WordFindQues({
    this.count,
    this.shuffled,
    this.question,
    this.answer,
    // this.arrayBtns,
  });

  void setWordFindChar(List<WordFindChar> puzzles) => this.puzzles = puzzles;

  void setIsDone() => this.isDone = true;

  Future<bool> fieldCompleteCorrect() async {
    // lets declare class WordFindChar 1st
    // check all field already got value
    // fix color red when value not full but show red color
    bool complete =
        this.puzzles.where((puzzle) => puzzle.currentValue == null).length == 0;

    if (!complete) {
      // no complete yet
      this.isFull = false;
      return complete;
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(ShareData.counter, complete.toString());
    print(complete);

    this.isFull = true;

    // if already complete, check correct or not

    String answeredString =
        this.puzzles.map((puzzle) => puzzle.currentValue).join("");
    // if same string, answer is correct..yeay

    return answeredString == this.answer;
  }

  // more prefer name.. haha
  WordFindQues clone() {
    return new WordFindQues(
      answer: this.answer,
      count: this.count,
      question: this.question,
      shuffled: this.shuffled,
    );
  }

  // lets generate sample question
}

// done
class WordFindChar {
  var currentValue;
  var currentIndex;
  var correctValue;
  bool hintShow;

  WordFindChar({
    this.hintShow = false,
    this.correctValue,
    this.currentIndex,
    this.currentValue,
  });

  getCurrentValue() {
    if (this.correctValue != null)
      return this.currentValue;
    else if (this.hintShow) return this.correctValue;
  }

  void clearValue() {
    this.currentIndex = null;
    this.currentValue = null;
  }
}
