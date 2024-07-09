import 'package:flutter/material.dart';

class AppTextLarge extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const AppTextLarge(
      {super.key,
      required this.text,
      this.size = 30,
      this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
