import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  const FadeAnimation({required this.delay, required this.child, super.key});

  final double delay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween(
        'opacity',
        Tween<double>(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 500),
      )
      ..tween(
        'translateY',
        Tween<double>(begin: 120.0, end: 0.0),
        duration: const Duration(
          milliseconds: 500,
        ),
        curve: Curves.linear,
      );
// https://stackoverflow.com/questions/66569886/the-method-controlledanimation-isnt-defined-for-the-type-logostate
    // return ControlledAnimation();
    return PlayAnimationBuilder(
      delay: Duration(milliseconds: (delay * 500).round()),
      duration: tween.duration,
      tween: tween,
      builder: (context, value, _) {
        return Opacity(
          opacity: value.get('opacity'),
          child: Transform.translate(
            offset: Offset(
              0,
              value.get('translateY'),
            ),
            child: child,
          ),
        );
      },
    );
  }
}
