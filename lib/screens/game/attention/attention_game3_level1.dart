import 'dart:async';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/screens/game/attention/Level1/game/game_main.dart';
import 'package:flutter_application_1/screens/game/attention/Level1/view/gamebar_view.dart';
// import 'package:freedefense/game/game_main.dart';
import 'package:flutter_application_1/screens/game/attention/Level1/game/game_test.dart';
import 'package:flutter_application_1/theme_color/light_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../general/app_route.dart';

class GameAtte3Level1 extends StatefulWidget {
  const GameAtte3Level1({Key? key}) : super(key: key);

  @override
  State<GameAtte3Level1> createState() => _GameAtte3Level1State();
}

class _GameAtte3Level1State extends State<GameAtte3Level1> {
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
                Navigator.of(context).pushNamed(RouteGenerator.attentionScreen);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    GameTest game = GameTest();
    return WillPopScope(
      onWillPop: () async {
        final back = await showMyDialog(context);
        return back ?? false;
      },
      child:
          // WillPopScope(
          // onWillPop: () async {
          //   final back = await showMyDialog(context);
          //   return back ?? false;
          // },
          Scaffold(
        body: Container(
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
                  image: AssetImage('assets/images/cat.gif'),
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
                  Expanded(
                    flex: 2,
                    child: Container(
                      // margin: const EdgeInsets.all(16),
                      height: 350,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 0),
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
                                              // final back =
                                              //     await showMyDialog(context);
                                              // if (back == true) {
                                              //   Navigator.pop(context, back);
                                              // }
                                            },
                                            icon: const Icon(
                                              Icons.arrow_circle_left_outlined,
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
                                              // _dialogBuilderTwo(context);
                                              // stopTime = true;
                                            },
                                            icon: const Icon(
                                              Icons.question_mark_rounded,
                                              size: 35,
                                            ),
                                            color: Colors.black,
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              // stopTime = true;
                                              // _dialogBuilderTwo(context);
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
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: GameWidget<GameMain>(
                                          game: game,
                                          overlayBuilderMap: {
                                            // "${WeaponViewWidget.name}-0": WeaponViewWidget.builder,
                                            // "${WeaponViewWidget.name}-1": WeaponViewWidget.builder,
                                            'start': _pauseMenuBuilder,
                                            'gameover': _gameOverBuilder,
                                            'nextlevel': _nextMenuBuilder,
                                          },
                                          initialActiveOverlays: const [
                                            'start'
                                          ],
                                        ),
                                      ),
                                      // Expanded(
                                      //   flex: 1,
                                      //   child: Container(
                                      //     margin: const EdgeInsets.only(
                                      //       top: 20,
                                      //       bottom: 20,
                                      //       left: 20,
                                      //       right: 20,
                                      //     ),
                                      //     padding: const EdgeInsets.symmetric(
                                      //         vertical: 6, horizontal: 22),
                                      //     height: 200,
                                      //     decoration: BoxDecoration(
                                      //       color: LightColors.kLightYellow,
                                      //       borderRadius:
                                      //           BorderRadius.circular(12),
                                      //     ),
                                      //     child: Column(
                                      //       children: [
                                      //         Padding(
                                      //           padding: const EdgeInsets.only(
                                      //             top: 30,
                                      //             bottom: 10,
                                      //           ),
                                      //           child: Text(
                                      //               "Nhập từ thích hợp bắt đầu bằng chữ  : ",
                                      //               textAlign: TextAlign.center,
                                      //               style: const TextStyle(
                                      //                   fontWeight:
                                      //                       FontWeight.bold,
                                      //                   color: Colors.black,
                                      //                   fontSize: 25)),
                                      //         ),

                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  // return Expanded(
  //   child: GameWidget<GameMain>(
  //     game: game,
  //     overlayBuilderMap: {
  //       // "${WeaponViewWidget.name}-0": WeaponViewWidget.builder,
  //       // "${WeaponViewWidget.name}-1": WeaponViewWidget.builder,
  //       'start': _pauseMenuBuilder,
  //       'gameover': _gameOverBuilder,
  //       'nextlevel': _nextMenuBuilder,
  //     },
  //     initialActiveOverlays: const ['start'],
  //   ),
  // );
}

//   @override
//   void initState() {
//     super.initState();
//     // startTimer();
//     // game.start();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }
// }

Widget _pauseMenuBuilder(BuildContext buildContext, GameMain game) {
  return Center(
      child: Container(
    width: 100,
    height: 100,
    color: Colors.orange,
    child: Center(
        child: TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        primary: Colors.white,
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: () {
        // if (cout == 0;){

        // }
        game.start();
        // game.TimerDown();
        game.overlays.remove('start');
      },
      child: Text('test:${game.remainingTime}'),
    )),
  ));
}

Widget _nextMenuBuilder(BuildContext buildContext, GameMain game) {
  return Center(
      child: Container(
    width: 100,
    height: 100,
    color: Colors.green,
    child: Center(
        child: TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        primary: Colors.white,
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: () {
        // game.start();
        // game.TimerDown();
        Navigator.of(buildContext).pushNamed(RouteGenerator.game3atte2);
        game.overlays.remove('nextlevel');
      },
      child: Text('test:${game.remainingTime}'),
    )),
  ));
}

Widget _gameOverBuilder(BuildContext buildContext, GameMain game) {
  // GameTest game = GameTest();
  return Center(
      child: Container(
    width: 100,
    height: 100,
    color: Colors.red,
    child: Center(
        child: TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        primary: Colors.white,
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: () {
        Navigator.of(buildContext).pushNamed(RouteGenerator.attentionScreen);
        // game.start();
        // const MaterialApp(home: AppView());
        game.overlays.remove('gameover');
      },
      child: const Text('Game Over'),
    )),
  ));
}

void test() {}
