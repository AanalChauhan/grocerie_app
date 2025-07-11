import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  const StyledButton(this.onTap, this.btntext, {super.key});

  final void Function() onTap;
  final String btntext;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 67,
      // margin: EdgeInsets.symmetric(horizontal: 30.5),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          btntext,
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
