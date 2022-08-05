import 'package:flutter/material.dart';

import '../../../core/consts/enums.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/index.dart';

class LoginPageFormTitle extends StatelessWidget {
  const LoginPageFormTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppFadeAnimation(
      duration: const Duration(milliseconds: 800),
      child: Center(
          child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.lock_outline,
            size: getIconSize(SizeType.ultra),
            color: AppColors.navyBlue,
          ),
          SizedBox(
            width: convertSize(5.0),
          ),
          Text(
            t('lp_title'),
            style: TextStyle(
              color: AppColors.black,
              fontSize: getFontSize(SizeType.ultra),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )),
    );
  }
}
