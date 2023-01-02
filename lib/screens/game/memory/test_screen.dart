import 'package:flutter_application_1/data/data_memory/data_memory_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/general/app_route.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
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

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        final back = await showMyDialog(context);
        return back ?? false;
      },
      child: Material(
        child: Container(
          width: screen_width,
          height: screen_height,
          child: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    width: screen_width,
                    height: screen_height / 1.6,
                    decoration: const BoxDecoration(
                      color: Colors.white, // White
                    ),
                  ),
                  Container(
                    width: screen_width,
                    height: screen_height / 1.6,
                    decoration: const BoxDecoration(
                      color: Color(0xFF674AEF),
                      // color: Colors.amberAccent,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(70),
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/cup.png",
                        scale: 1.5,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: screen_width,
                      height: screen_height / 2.666,
                      decoration: const BoxDecoration(
                        color: Color(0xFF674AEF),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: screen_width,
                      height: screen_height / 2.666,
                      padding: const EdgeInsets.only(top: 40, bottom: 30),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(70),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Điểm số:",
                            style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              wordSpacing: 2,
                            ),
                          ),
                          Text(
                            "$score",
                            style: const TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontSize: 30,
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
                                  "Cấp độ cao nhất của bạn:",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    decoration: TextDecoration.none,
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                ),
                                Text(
                                  "$maxLevel",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 25,
                                    decoration: TextDecoration.none,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Material(
                            color: Color(0xFF674AEF),
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(RouteGenerator.memoryScreen);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 80,
                                ),
                                child: const Text(
                                  "Kết Thúc",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
