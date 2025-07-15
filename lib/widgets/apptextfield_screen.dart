import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/app_colors.dart';

class ApptextfieldScreen extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final IconData? suffixIcon;
  final bool? obsecureText;
  final TextInputType? keyboardType;

  const ApptextfieldScreen({
    super.key,
    required this.controller,
    required this.hintText,
    this.obsecureText=false,
    required this.keyboardType,
    this.suffixIcon,
  });

  @override
  State<ApptextfieldScreen> createState() => _ApptextfieldScreenState();
}


class _ApptextfieldScreenState extends State<ApptextfieldScreen> {
late bool _obsecureText;
  @override
  void initState(){
    super.initState();
    _obsecureText = widget.obsecureText??false;

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: _obsecureText ,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.subtext),
          suffixIcon:  widget.suffixIcon != null
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obsecureText = !_obsecureText;
                    });
                  },
                  icon: Icon(
                    _obsecureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  color: AppColors.subtext,
                )
              : null,
        ),
      ),
    );
  }
}
