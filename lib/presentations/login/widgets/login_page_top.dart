import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/index.dart';

class LoginPageTop extends StatelessWidget {
  const LoginPageTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AppWavyBottomCLipper(),
      child: Container(
        height: getHeight(context, percent: .45),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              AppColors.red[300]!,
              AppColors.red[900]!,
              AppColors.red[600]!,
            ],
          ),
        ),
        child: Center(
          child: AppFadeAnimation(
            duration: const Duration(milliseconds: 600),
            child: AppLogoImage(
              width: convertSize(200),
              height: convertSize(200),
              inAnimated: false,
            ),
          ),
        ),
      ),
    );
  }
}
