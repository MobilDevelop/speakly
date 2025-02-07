import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speakly/application/auth/auth_event.dart';
import 'package:speakly/application/auth/auth_state.dart';
import 'package:speakly/infrastructure/helper/helper.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc() : super(AuthInitial()){
     
    /// choose Auth service
    on<LoginEvent>((event, emit){
       emit(AuthLogin());
    });

    on<RegistrationEvent>((event, emit){
      emit(AuthRegistration());
    });
    /// choose Auth service
    
    
    /// AuthLogin Service
    on<PasswordVisibleEvent>((event, emit){
      emit((state as AuthLogin).copyWith(visibility: event.visible));
    });

    on<AuthSuccessEvent>((event, emit) {
      bool check = Helper.isEmail(event.text);

      if(check){
        if(event.type==1){
        emit((state as AuthLogin).copyWith(errorEmail: !check));
        }else{
        emit((state as AuthRegistration).copyWith(errorEmail: !check));
        }
      }else{
        emit(OpeanSuccesCode());
      }
    });
    /// AuthLogin service
    
    on<ChekedEvent>((event, emit){
       if(state is AuthLogin){
        emit((state as AuthLogin).copyWith(checked: event.check));
       }else if(state is AuthRegistration){
        emit((state as AuthRegistration).copyWith(checked: event.check));
       }
    });

    on<GoogleEvent>((event, emit) {
      
    });
    
  }
}