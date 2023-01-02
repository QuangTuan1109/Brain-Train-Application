import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({
    Key? key,
    required this.score,
  }) : super(key: key);

  final int score;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 10),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                '/images/score_shape.jpg',
                width: 170,
              ),
              Text(
                score.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
