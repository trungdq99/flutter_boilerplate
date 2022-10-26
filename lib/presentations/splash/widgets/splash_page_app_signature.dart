import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/consts/enums.dart';
import '../../../core/localization/app_localization_key.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/widgets.dart';

class SplashPageSignature extends StatelessWidget {
  const SplashPageSignature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: 0.7,
        child: Text(
          t(AppLocalizationKey.spSignature),
          style: GoogleFonts.bitter(
              fontSize: getFontSize(SizeType.xxLarge),
              color: AppColors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
