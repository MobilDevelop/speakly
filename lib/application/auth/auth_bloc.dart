import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speakly/application/auth/auth_event.dart';
import 'package:speakly/application/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc() : super(AuthInitial()){
    on<LoginEvent>((event, emit){
      emit(AuthLogin());
    });

    on<RegistrationEvent>((event, emit){
      emit(AuthRegistration());
    });
    
  }

  
}