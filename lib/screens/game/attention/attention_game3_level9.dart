import 'dart:async';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/screens/game/attention/Level9/game/game_main.dart';
import 'package:flutter_application_1/screens/game/attention/Level9/view/gamebar_view.dart';
// import 'package:freedefense/game/game_main.dart';
import 'package:flutter_application_1/screens/game/attention/Level9/game/game_test.dart';
import 'package:flutter_application_1/theme_color/light_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../general/app_route.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../data/data_onborad/data_languages_1.dart';
import '../../../general/app_route.dart';

class GameAtte3Level9 extends StatefulWidget {
  const GameAtte3Level9({Key? key}) : super(key: key);

  @override
  State<GameAtte3Level9> createState() => _GameAtte3Level9State();
}

class _GameAtte3Level9State extends State<GameAtte3Level9> {
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

  Future<void> _dialogBuilderTwo(BuildContext context) {
    final obController = OnBoardingController();
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
                    // stopTime = false;
                  },
                  child:
                      const Text("Skip", style: TextStyle(color: Colors.grey)),
                ),
              ),
              Obx(
                () => Positioned(
                  bottom: 10,
                  child: AnimatedSmoothIndicator(
                    count: 3,
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
                                              final back =
                                                  await showMyDialog(context);
                                              if (back == true) {
                                                Navigator.pop(context, back);
                                              }
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
                                              _dialogBuilderTwo(context);
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
  bool back = false;
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
        Navigator.pop(buildContext, back);
        game.overlays.remove('nextlevel');
      },
      child: Text('test:${game.remainingTime}'),
    )),
  ));
}

Widget _gameOverBuilder(BuildContext buildContext, GameMain game) {
  bool back = false;
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
        Navigator.pop(buildContext, back);
        // game.start();
        // const MaterialApp(home: AppView());
        game.overlays.remove('gameover');
      },
      child: const Text('Game Over'),
    )),
  ));
}

void test() {}
