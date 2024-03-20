import 'package:expense_tracker/core/theming/fonts.dart';
import 'package:flutter/material.dart';

import '../theming/colors.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField({super.key, required this.hintText, this.suffixIcon, required this.isPassword, required this.controller, this.validator});

  final String hintText;
  final Widget ? suffixIcon;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isPassword,
      style: AppFont.font18GreyW300,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: AppFont.font18GreyW300,
          fillColor: AppColors.greyColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          )
      ),
    );
  }
}
