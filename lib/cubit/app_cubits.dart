import 'package:bloc/bloc.dart';
import 'package:my_app/cubit/app_cubit_states.dart';
import 'package:my_app/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      print("Loading Data is done here/////////");
      emit(LoadedState(places));
    } catch (err) {
      print(err);
    }
  }

  detailPage(int id) {
    emit(DetailState(id));
  }
}
