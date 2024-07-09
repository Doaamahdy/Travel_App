import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/cubit/app_cubits.dart';
import 'package:my_app/misc/colors.dart';
import 'package:my_app/widgets/app_large_text.dart';
import 'package:my_app/widgets/app_text.dart';
import 'package:my_app/widgets/customButton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome1.png",
    "welcome2.png",
    "welcome3.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/" + images[index]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppTextLarge(
                          text: "Trips",
                        ),
                        const AppText(
                          text: "Mountain",
                          size: 30,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 250,
                          child: AppText(
                            text:
                                "Mountains give you an incredible sense of freedom along with endurance test",
                            color: AppColr.textColor2,
                            size: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("tapped////////");
                            BlocProvider.of<AppCubits>(context).getData();
                          },
                          child: Container(
                            width: 120,
                            child: CustomButton(width: 120),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          height: indexDots == index ? 25 : 8,
                          width: 8,
                          decoration: BoxDecoration(
                            color: indexDots == index
                                ? AppColr.mainColor
                                : AppColr.mainColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
