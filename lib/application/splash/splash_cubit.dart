import 'package:bloc/bloc.dart';
import 'package:speakly/application/splash/splash_state.dart';
import 'package:speakly/domain/common/constants.dart';
import 'package:speakly/infrastructure/local_source/local_source.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit():super(SplashInitial()){
    init();
  }

   void init()async{
    await Future.delayed(Duration(milliseconds: AppContatants.duration));
    String token = await LocalSource.getInfo(key: "token");
    if(token.isEmpty){
      emit(SplashNextLogin());
    }else{
      emit(SplashNextMain());
    }
   }
}