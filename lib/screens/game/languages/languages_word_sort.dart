import 'dart:math';
import 'package:flutter_application_1/data/data_language/list_questiom_four.dart';
import 'package:flutter/material.dart';
import 'package:word_search/word_search.dart';

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
  late List<WordFindQues> listQuestions;
  int indexQues = 0; // current index question
  int hintCount = 0;

  // thanks for watching.. :)

  @override
  void initState() {
    super.initState();
    size = widget.size;
    listQuestions = widget.listQuestions;
    generatePuzzle();
  }

  @override
  Widget build(BuildContext context) {
    // lets make ui
    // let put current data on question
    WordFindQues currentQues = listQuestions[indexQues];
    // print(currentQues);
    var test = int.parse(currentQues.count);
    assert(test is int);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sắp xếp Từ'),
        backgroundColor: Colors.yellow[600],
      ),
      body: Container(
        width: double.maxFinite,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () => generateHint(),
                        child: Icon(
                          Icons.tungsten_outlined,
                          size: 45,
                          color: Colors.yellow[900],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          currentQues.isDone = false;
                          generatePuzzle(next: true);
                          currentQues.isFull = false;
                        },
                        child: Icon(
                          Icons.sync_outlined,
                          size: 45,
                          color: Colors.yellow[900],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => generatePuzzle(left: true),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 45,
                          color: Colors.yellow[900],
                        ),
                      ),
                      InkWell(
                        onTap: () => generatePuzzle(next: true),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 45,
                          color: Colors.yellow[900],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(30, 55, 50, 70),
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
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              alignment: Alignment.center,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: currentQues.puzzles.map((puzzle) {
                      // later change color based condition
                      Color? color;

                      if (currentQues.isDone)
                        color = Colors.green[600];
                      else if (puzzle.hintShow) {
                        color = Colors.green[600];
                      } else if (currentQues.isFull) {
                        color = Colors.red;
                      } else {
                        color = Colors.yellow;
                      }

                      return InkWell(
                        onTap: () {
                          if (puzzle.hintShow || currentQues.isDone) return;
                          currentQues.isFull = false;
                          // currentQues.isDone = false;
                          puzzle.clearValue();
                          setState(() {});
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: constraints.biggest.width / test - 6,
                          height: constraints.biggest.width / 8,
                          margin: EdgeInsets.all(3),
                          child: Text(
                            "${puzzle.currentValue ?? ''}".toUpperCase(),
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisCount: test,
                  crossAxisSpacing: 3,
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
                      Color color =
                          statusBtn ? Color(0xFFFFD600) : Color(0xFFFFFD9D);

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
                            "${currentQues.arrayBtns[index]}".toUpperCase(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
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
      ),
    );
  }

  void generatePuzzle({
    List<WordFindQues>? loop,
    bool next: false,
    bool left: false,
  }) {
    // lets finish up generate puzzle
    if (loop != null) {
      indexQues = 0;
      this.listQuestions = <WordFindQues>[];
      this.listQuestions.addAll(loop);
    } else {
      if (next &&
          listQuestions[indexQues].isDone &&
          indexQues < listQuestions.length - 1)
        indexQues++;
      else if (left && indexQues > 0)
        indexQues--;
      else if (indexQues >= listQuestions.length - 1) return;

      setState(() {});

      if (this.listQuestions[indexQues].isDone) return;
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

    List<WordFindChar> puzzleNoHints = currentQues.puzzles
        .where((puzzle) => !puzzle.hintShow && puzzle.currentIndex == null)
        .toList();

    if (puzzleNoHints.length > 0) {
      hintCount++;
      int indexHint = Random().nextInt(puzzleNoHints.length);
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

      // check if complete

      if (currentQues.fieldCompleteCorrect()) {
        currentQues.isDone = true;

        setState(() {});

        await Future.delayed(Duration(seconds: 1));
        generatePuzzle(next: true);
      }

      // my wrong..not refresh.. damn..haha
      setState(() {});
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

      if (currentQues.fieldCompleteCorrect()) {
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

  bool fieldCompleteCorrect() {
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
