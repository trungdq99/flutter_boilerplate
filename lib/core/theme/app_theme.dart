import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Application theme
final ThemeData themeData = ThemeData(
  textTheme: GoogleFonts.loraTextTheme(),
  brightness: Brightness.light,
  primaryColor: AppColors.red,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: AppColors.red)
      .copyWith(secondary: AppColors.sky),
);
