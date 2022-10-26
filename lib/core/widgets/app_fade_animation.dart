import 'package:flutter/cupertino.dart';

class AppFadeAnimation extends StatelessWidget {
  final Widget? child;
  final Duration duration;
  final Curve curve;

  const AppFadeAnimation({
    super.key,
    this.duration = const Duration(seconds: 1),
    this.curve = Curves.easeOut,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: duration,
      curve: curve,
      builder: (_, doubleValue, child) {
        return Transform.translate(
            offset: Offset(0.0, (doubleValue - 1) * -30),
            child: Opacity(
              opacity: doubleValue,
              child: child,
            ));
      },
      child: child,
    );
  }
}
