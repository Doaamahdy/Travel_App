import 'package:flutter/material.dart';
import 'package:my_app/widgets/app_text.dart';
import 'package:my_app/misc/colors.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  String? text;
  IconData? icon;
  bool? isIcon;

  AppButton(
      {super.key,
      required this.size,
      required this.backgroundColor,
      required this.color,
      required this.borderColor,
      this.text = "",
      this.icon,
      this.isIcon = false});

  @override
  Widget build(BuildContext context) {
    int _number;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor),
      child: Center(
        child: isIcon == false
            ? Center(
                child: AppText(
                  text: text!,
                  color: color,
                ),
              )
            : Icon(
                icon,
                color: color,
              ),
      ),
    );
  }
}
