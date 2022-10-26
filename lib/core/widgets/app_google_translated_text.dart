import 'package:flutter/material.dart';

import '../consts/app_consts.dart';
import '../consts/enums.dart';
import '../theme/app_colors.dart';
import 'widgets.dart';

/// [AppGTText] translated the [text] string from the google, and show it a [AppRichText] component.
class AppGTText extends StatelessWidget {
  /// the string value which gonna be translated from google!
  final String text;
  final TextAlign align;
  final FontWeight? fontWeight;
  final Color color;
  final int maxLines;
  final SizeType sizeType;

  const AppGTText({
    super.key,
    required this.text,
    this.align = TextAlign.start,
    this.color = AppColors.black,
    this.sizeType = SizeType.middle,
    this.maxLines = AppConsts.intInfinity,
    this.fontWeight,
  });
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: tg(text),
        initialData: text,
        builder: (_, snapshot) {
          return AppRichText(
            text: snapshot.data ?? '',
            maxLines: maxLines,
            align: align,
            color: color,
            fontSize: sizeType,
            fontWeight: fontWeight,
          );
        });
  }
}
