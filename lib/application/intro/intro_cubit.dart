import 'package:bloc/bloc.dart';
import 'package:speakly/application/intro/intro_state.dart';
import 'package:speakly/domain/common/constants.dart';
import 'package:speakly/presentantion/routes/index_routes.dart';

class IntroCubit extends Cubit<IntroState> {
  IntroCubit() : super(IntroInitial());

  void setPage(int index){
    
    emit((state as IntroInitial).copyWith(index: index));
  }

  void nextPage(){
    final current = state as IntroInitial;
    current.pagecontroller.nextPage(curve: Curves.linear,duration: Duration(milliseconds: AppContatants.duration));
    if(current.pagecontroller.page==2){
     emit(IntroNextAuth());
    }else{
      emit(current.copyWith());
    }
  }
}
