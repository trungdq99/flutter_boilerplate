import 'package:flutter/material.dart';

class AppImageHero extends StatelessWidget {
  final String path;

  const AppImageHero({
    super.key,
    required this.path,
  });
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: path,
      child: Image.network(
        path,
        fit: BoxFit.fill,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}
