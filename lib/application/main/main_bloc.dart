import 'package:bloc/bloc.dart';
import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<MainBottomItem>((event, emit) {
      emit((state as MainInitial).copyWith(index: event.index));
    });
  }
}
