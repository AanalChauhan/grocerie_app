import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/app_colors.dart';

class ApptextfieldScreen extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final IconData? suffixIcon;
  final bool? obsecureText;
  final TextInputType? keyboardType;

  const ApptextfieldScreen({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obsecureText,
    required this.keyboardType,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obsecureText ?? false,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hintText,
          hintStyle: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: AppColors.subtext),
          suffixIcon: suffixIcon != null
              ? Icon(suffixIcon, color: AppColors.subtext)
              : null,
        ),
      ),
    );
  }
}
