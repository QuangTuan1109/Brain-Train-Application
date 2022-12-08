// import 'dart:async';

// import 'package:flutter/material.dart';

// class OtpTimer extends StatefulWidget {
//   @override
//   _OtpTimerState createState() => _OtpTimerState();
// }

// class _OtpTimerState extends State<OtpTimer> {
//   final interval = const Duration(seconds: 1);

//   final int timerMaxSeconds = 60;

//   int currentSeconds = 0;

//   String get timerText =>
//       '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

//   startTimeout([int milliseconds = 0]) {
//     var duration = interval;
//     Timer.periodic(duration, (timer) {
//       setState(() {
//         // print(timer.tick);
//         currentSeconds = timer.tick;
//         if (timer.tick >= timerMaxSeconds) timer.cancel();
//       });
//     });
//   }

//   @override
//   void initState() {
//     startTimeout();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Icon(
//           Icons.timer,
//           size: 50,
//         ),
//         SizedBox(
//           width: 5,
//         ),
//         Text(timerText)
//       ],
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/room.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTimer extends ConsumerStatefulWidget {
  const CustomTimer({Key? key, required this.leftSeconds}) : super(key: key);

  final int leftSeconds;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomTimerState();
}

class _CustomTimerState extends ConsumerState<CustomTimer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 25,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white38,
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Consumer(
            builder: (context, ref, child) {
              final room = ref.watch(roomProvider);
              return FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: room.seconds / 60,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xE6FFCD4D),
                  ),
                ),
              );
            },
          ),
          Positioned(
            left: 10,
            child: Consumer(
              builder: (context, ref, child) {
                final room = ref.watch(roomProvider);
                return Text('${room.seconds} giây');
              },
            ),
          ),
          const Positioned(
            right: 10,
            child: Icon(
              Icons.timer,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
