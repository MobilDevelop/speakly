import 'package:bloc/bloc.dart';
import 'package:speakly/domain/provider/home_service.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeFirstEvent>((event, emit)async{
      final result = await HomeService().getScore();
      if(result.isRight()){
        emit((state as HomeInitial).copyWith(info: result.toNullable(),loading: false));
      }
    });
  }
}
