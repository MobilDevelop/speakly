import 'package:bloc/bloc.dart';
import 'package:speakly/application/splash/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit():super(SplashInitial()){
    init();
  }

   void init()async{
    await Future.delayed(Duration(seconds: 2));
     emit(SplashNextIntro());
   }
}