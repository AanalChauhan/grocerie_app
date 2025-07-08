import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(this.onTap, {super.key});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 67,
      margin: EdgeInsets.symmetric(horizontal: 30.5),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          "Get Started",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
