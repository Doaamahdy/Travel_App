import 'package:flutter/material.dart';
import 'package:my_app/misc/colors.dart';
import 'package:my_app/widgets/appButton.dart';
import 'package:my_app/widgets/app_text.dart';
import 'package:my_app/widgets/app_large_text.dart';
import 'package:my_app/widgets/customButton.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int _gottenStars = 4;
  int _selectedNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'images/mountain.jpeg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      print("Menu pressed");
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 300,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppTextLarge(
                            text: "Yosertrie",
                            color: Colors.black54.withOpacity(0.7)),
                        AppTextLarge(
                          text: "\$ 250",
                          color: AppColr.mainColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColr.mainColor),
                        SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text: "Egypt, Mamsoura",
                          color: AppColr.mainTextColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: List.generate(5, (index) {
                            return Icon(Icons.star,
                                color: index < _gottenStars
                                    ? AppColr.starColor
                                    : AppColr.textColor1);
                          }),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        AppText(
                          text: "(4.0)",
                          color: AppColr.textColor2,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    AppTextLarge(
                      text: "People",
                      color: Colors.black.withOpacity(0.7),
                      size: 20,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AppText(
                      text: "Number of people in your group",
                      color: AppColr.mainTextColor,
                    ),
                    Wrap(
                      children: List.generate(5, (index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10, top: 10),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedNumber = index;
                              });
                            },
                            child: AppButton(
                              size: 60,
                              backgroundColor: _selectedNumber == index
                                  ? Colors.black
                                  : AppColr.buttonBackground,
                              color: _selectedNumber == index
                                  ? Colors.white
                                  : Colors.black,
                              borderColor: AppColr.buttonBackground,
                              text: (index + 1).toString(),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppTextLarge(
                      text: "Description",
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppText(
                      text:
                          "You must go for a travel. Travel helps you git rid of pressure. Go to the mountains to see the nature.",
                      color: AppColr.mainTextColor,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              height: 100,
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppButton(
                    size: 60,
                    backgroundColor: Colors.white,
                    color: AppColr.mainColor,
                    borderColor: AppColr.mainColor,
                    icon: Icons.favorite_border,
                    isIcon: true,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  const CustomButton(
                    isResponsive: true,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
