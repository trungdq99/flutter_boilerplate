import 'package:flutter/material.dart';

import 'app_widget_extension.dart';

class AppImageRotater extends StatefulWidget {
  final double sizePercent;
  final bool animateToReverse;
  final double opacity;
  final Duration animationDuration;
  final Color color;
  final String imagePath;

  const AppImageRotater(
      {super.key,
      this.sizePercent = 0.5,
      this.animateToReverse = false,
      this.opacity = 1,
      required this.animationDuration,
      required this.color,
      required this.imagePath});

  @override
  State<AppImageRotater> createState() => _AppImageRotaterState();
}

class _AppImageRotaterState extends State<AppImageRotater>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Center(
        child: RotationTransition(
          turns: _twen.animate(_controller),
          child: SizedBox(
            child: Image.asset(
              widget.imagePath,
              height: widget.getHeight(context, percent: widget.sizePercent),
              width: widget.getWidth(context, percent: widget.sizePercent),
              color: widget.color.withOpacity(widget.opacity),
            ),
          ),
        ),
      ),
    );
  }

  Tween<double> get _twen {
    return widget.animateToReverse
        ? Tween(begin: 1.0, end: 0.0)
        : Tween(begin: 0.0, end: 1.0);
  }
}
