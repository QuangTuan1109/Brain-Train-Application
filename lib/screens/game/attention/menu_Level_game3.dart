import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../general/app_route.dart';

class LevelsScreen extends ConsumerWidget {
  const LevelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Color> colors = [
      Colors.red,
      Colors.redAccent,
      Colors.purple,
      Colors.blueAccent,
      Colors.amber,
      Colors.blue
    ];
    final random = Random().nextInt(6);
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                const SizedBox(width: 10),
                const Text(
                  'levels',
                  style: TextStyle(fontSize: 23),
                ),
                const SizedBox.shrink(),
              ],
            ),
          ),
          // GridView.builder(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //   ),
          //   itemCount: 6,
          //   itemBuilder: (BuildContext context, int index) {

          // ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // padding: const EdgeInsets.only(
                //     top: 10, bottom: 10, left: 10, right: 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RouteGenerator.game3atte1);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/images/icon_shark.png',
                                height: 200,
                                width: 190,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Level 1',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ])
                  ],
                ),
              ),
              Container(
                // padding: const EdgeInsets.only(
                //     top: 10, bottom: 10, left: 10, right: 10),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Column(children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RouteGenerator.game3atte2);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/images/icon_shark.png',
                                height: 200,
                                width: 190,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Level 2',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ])
                  ],
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // padding: const EdgeInsets.only(
                //     top: 10, bottom: 10, left: 10, right: 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RouteGenerator.game3atte3);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/images/icon_shark.png',
                                height: 200,
                                width: 190,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Level 3',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ])
                  ],
                ),
              ),
              Container(
                // padding: const EdgeInsets.only(
                //     top: 10, bottom: 10, left: 10, right: 10),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Column(children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RouteGenerator.game3atte4);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/images/icon_shark.png',
                                height: 200,
                                width: 190,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Level 4',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ])
                  ],
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // padding: const EdgeInsets.only(
                //     top: 10, bottom: 10, left: 10, right: 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RouteGenerator.game3atte5);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/images/icon_shark.png',
                                height: 200,
                                width: 190,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Level 5',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ])
                  ],
                ),
              ),
              Container(
                // padding: const EdgeInsets.only(
                //     top: 10, bottom: 10, left: 10, right: 10),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Column(children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RouteGenerator.game3atte6);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/images/icon_shark.png',
                                height: 200,
                                width: 190,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Level 6',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ])
                  ],
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // padding: const EdgeInsets.only(
                //     top: 10, bottom: 10, left: 10, right: 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RouteGenerator.game3atte7);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/images/icon_shark.png',
                                height: 200,
                                width: 190,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Level 7',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ])
                  ],
                ),
              ),
              Container(
                // padding: const EdgeInsets.only(
                //     top: 10, bottom: 10, left: 10, right: 10),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Column(children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RouteGenerator.game3atte8);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/images/icon_shark.png',
                                height: 200,
                                width: 190,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Level 8',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ])
                  ],
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // padding: const EdgeInsets.only(
                //     top: 10, bottom: 10, left: 10, right: 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RouteGenerator.game3atte9);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/images/icon_shark.png',
                                height: 200,
                                width: 190,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Level 9',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ])
                  ],
                ),
              ),
              Container(
                // padding: const EdgeInsets.only(
                //     top: 10, bottom: 10, left: 10, right: 10),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Column(children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RouteGenerator.game3atte10);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/images/icon_shark.png',
                                height: 200,
                                width: 190,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Level 10',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ])
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
