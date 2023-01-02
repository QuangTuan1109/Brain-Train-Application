import 'package:flutter_application_1/data/data_memory/data_memory_two.dart';
import 'package:flutter/material.dart';

class ResultMemoryThree extends StatefulWidget {
  const ResultMemoryThree({super.key});

  @override
  State<ResultMemoryThree> createState() => _ResultMemoryThreeState();
}

class _ResultMemoryThreeState extends State<ResultMemoryThree> {
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    return Material(
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
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: screen_width,
                  height: screen_height / 1.6,
                  decoration: const BoxDecoration(
                    color: Color(0xFF674AEF),
                    // color: Color(0xffff597b),
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
                                "Số lượt chọn đúng của bạn:",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  decoration: TextDecoration.none,
                                  color: Colors.black.withOpacity(0.8),
                                ),
                              ),
                              Text(
                                "$numOfCard",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
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
                            onTap: () {},
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
    );
  }
}
