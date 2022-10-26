import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'widgets.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  final Color color;
  final double sizePercent;

  const AppCircularProgressIndicator({
    super.key,
    this.color = AppColors.black,
    this.sizePercent = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AppImageRotater(
          imagePath: "assets/images/progress.ico",
          sizePercent: sizePercent,
          animationDuration: const Duration(milliseconds: 7500),
          opacity: .2,
          color: color,
        ),
        AppImageRotater(
          imagePath: "assets/images/progress.ico",
          opacity: .5,
          sizePercent: sizePercent / convertSize(4),
          color: color,
          animateToReverse: true,
          animationDuration: const Duration(milliseconds: 1250),
        ),
      ],
    );
  }
}
