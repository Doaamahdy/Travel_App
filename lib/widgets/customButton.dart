import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/misc/colors.dart';
import 'package:my_app/widgets/app_text.dart';

class CustomButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;

  const CustomButton({super.key, this.width = 120, this.isResponsive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isResponsive == true ? 300 : width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColr.mainColor,
      ),
      child: Row(
        mainAxisAlignment: isResponsive == true
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          isResponsive == true
              ? Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.only(right: 50),
                  child: AppText(
                    text: "Book Your Trip Now",
                    color: Colors.white,
                  ),
                )
              : Container(),
          Image.asset('images/button-one.png'),
        ],
      ),
    );
  }
}
