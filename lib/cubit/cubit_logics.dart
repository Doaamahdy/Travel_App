import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubit/app_cubit_states.dart';
import 'package:my_app/cubit/app_cubits.dart';
import 'package:my_app/misc/colors.dart';
import 'package:my_app/pages/detailsPage.dart';
import 'package:my_app/pages/homePage.dart';
import 'package:my_app/pages/welcomPage.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is WelcomeState) {
          return WelcomePage();
        } else if (state is LoadedState) {
          return HomePage();
        } else if (state is LoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColr.mainColor,
            ),
          );
        } else if (state is DetailState) {
          return DetailsPage();
        } else {
          return Container();
        }
      },
    ));
  }
}
