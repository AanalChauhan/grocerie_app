import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton(this.onTap, {super.key});
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 67,
      height: 67,
      child: FloatingActionButton(
        onPressed: onTap,
        shape: CircleBorder(),
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
