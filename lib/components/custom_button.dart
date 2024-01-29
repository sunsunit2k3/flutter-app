import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget icon;
  const CustomeButton({Key? key, this.onPressed, required this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: onPressed, child: icon);
  }
}
