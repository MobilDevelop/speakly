import 'package:bloc/bloc.dart';
import 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(WelcomeFirst());

  void nextSecond(){
    emit(WelcomeSecend());
  }

  void selectItem(int index){
    emit(WelcomeSecend(index: index));
  }
}
