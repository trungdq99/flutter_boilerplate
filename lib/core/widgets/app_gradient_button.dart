import 'package:flutter/material.dart';

import '../consts/enums.dart';
import '../theme/app_colors.dart';
import 'index.dart';

class AppGradientButton extends StatelessWidget {
  final Gradient? gradient;
  final void Function()? onTap;
  final String buttonText;
  final double radius;

  const AppGradientButton({
    super.key,
    this.gradient,
    this.onTap,
    required this.buttonText,
    this.radius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(convertSize(10))),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: convertSize(10.0)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            gradient: _gradient,
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: getFontSize(SizeType.middle),
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }

  Gradient get _gradient {
    if (gradient != null) return gradient!;
    return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[
        AppColors.red[300]!,
        AppColors.red[800]!,
        AppColors.red[600]!,
      ],
    );
  }
}
