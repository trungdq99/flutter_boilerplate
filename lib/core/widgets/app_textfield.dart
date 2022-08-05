import 'package:flutter/material.dart';

import '../consts/enums.dart';
import '../theme/app_colors.dart';
import 'index.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onIconClick;
  final bool obscureText;
  final ShapeBorder? shape;
  final IconData? icon;

  const AppTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onIconClick,
    this.obscureText = false,
    this.shape,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shape: _shape,
      child: TextFormField(
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        onSaved: onSaved,
        obscureText: obscureText,
        style: TextStyle(
          fontSize: getFontSize(SizeType.middle),
        ),
        cursorColor: AppColors.black,
        decoration: InputDecoration(
          prefix: SizedBox(
            width: convertSize(12.0),
          ),
          suffixIcon: icon != null
              ? InkWell(
                  onTap: onIconClick,
                  child: Container(
                    padding: EdgeInsets.only(right: convertSize(8)),
                    child: Icon(
                      icon,
                      size: getIconSize(SizeType.middle),
                      color: AppColors.red,
                    ),
                  ),
                )
              : null,
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }

  ShapeBorder get _shape {
    if (shape != null) return shape!;

    return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(convertSize(12.0)),
        side: BorderSide(
            color: AppColors.grey[400]!,
            width: convertSize(1.2),
            style: BorderStyle.solid));
  }
}
