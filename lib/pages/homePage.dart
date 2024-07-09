import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubit/app_cubit_states.dart';
import 'package:my_app/cubit/app_cubits.dart';
import 'package:my_app/misc/colors.dart';
import 'package:my_app/widgets/app_text.dart';
import 'package:my_app/widgets/app_large_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final images = {
    "kayaking.png": "kayaking",
    "balloning.png": "balloning",
    "hiking.png": "hiking",
    "snorkling.png": "snorkiling"
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is LoadedState) {
          var info = state.places;
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //the app bar
                Container(
                  padding: const EdgeInsets.only(top: 70),
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.black54,
                      ),
                      Expanded(child: Container()),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //Discover Text
                AppTextLarge(text: "Discover"),
                SizedBox(
                  height: 20,
                ),
                //tab Bar
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      labelStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      dividerColor: Colors.white,
                      tabAlignment: TabAlignment.start,
                      labelPadding: const EdgeInsets.only(left: 0, right: 20),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      controller: _tabController,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: CircleTabIndicator(
                          color: AppColr.mainColor, radius: 4),
                      tabs: const [
                        Tab(
                          text: "Places",
                        ),
                        Tab(
                          text: "Inspiration",
                        ),
                        Tab(
                          text: "Emotions",
                        ),
                      ],
                    ),
                  ),
                ),
                //tab View
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<AppCubits>(context).detailPage(id);
                  },
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.builder(
                          itemCount: info.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 10, top: 10),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "http://mark.bslmeiyu.com/uploads/" +
                                            info[index].img),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            );
                          },
                        ),
                        Text("Hi2"),
                        Text("Hi3"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTextLarge(
                        text: "Explore More",
                        size: 22,
                      ),
                      AppText(
                        text: "See all",
                        color: AppColr.textColor1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 150,
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 35),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage('images/' +
                                          images.keys.elementAt(index)),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: AppText(
                                text: images.values.elementAt(index),
                                color: AppColr.textColor2,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container(
            child: const Center(
              child: AppTextLarge(
                text: "Error Fetching Data",
                color: Colors.red,
              ),
            ),
          );
        }
      },
    ));
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;

    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    //Draw
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
