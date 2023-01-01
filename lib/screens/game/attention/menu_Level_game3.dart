import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../general/app_route.dart';

class LevelsScreen extends ConsumerWidget {
  const LevelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: 24,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(RouteGenerator.attentionScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 37, bottom: 10),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // ColorFiltered(
                            //   colorFilter: ColorFilter.mode(
                            //     colors[random].withOpacity(isOpen ? .9 : .2),
                            //     BlendMode.modulate,
                            //   ),
                            //   child: Image.asset('assets/images/level.png'),
                            // ),
                            Text(
                              'Level 1',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
