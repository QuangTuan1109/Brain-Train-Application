import 'package:flutter/material.dart';

class AnimationSwitcher extends StatelessWidget {
  const AnimationSwitcher({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      duration: const Duration(microseconds: 150),
      transitionBuilder: (Widget child, Animation<double> animation) =>
          FadeTransition(
        opacity: animation,
        child: child,
      ),
      child: child,
    );
  }
}
