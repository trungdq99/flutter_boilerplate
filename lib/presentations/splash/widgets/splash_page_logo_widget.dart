import 'package:flutter/material.dart';

import '../../../core/widgets/app_logo_image.dart';
import '../../../core/widgets/app_widget_extension.dart';

class SplashPageLogoWidget extends StatelessWidget {
  const SplashPageLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: convertSize(20)),
      child: AppLogoImage(
        height: convertSize(200),
        width: convertSize(200),
      ),
    );
  }
}
