import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speakly/application/auth/auth_event.dart';
import 'package:speakly/application/auth/auth_state.dart';
import 'package:speakly/domain/provider/auth_service.dart';
import 'package:speakly/infrastructure/helper/helper.dart';
import 'package:speakly/infrastructure/local_source/local_source.dart';

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

    on<AuthSuccessEvent>((event, emit)async{
      bool check = Helper.isEmail(event.text);

      if(!check){
        if(event.type==1){
        emit((state as AuthLogin).copyWith(errorEmail: !check));
        }else{
        emit((state as AuthRegistration).copyWith(errorEmail: !check));
        }
      }else{
        if(state is AuthLogin){
          final current = state as AuthLogin;
          emit((state as AuthLogin).copyWith(loading: true));

          String token = await AuthService().login(current.emailController.text,current.passwordController.text);
          emit((state as AuthLogin).copyWith(loading: false));
         
          if(token.isNotEmpty){
            LocalSource.putInfo(key: "token", json: token);
            emit(AuthNextMain());
            }  
        

        } else if(state is AuthRegistration){
          final current = state as AuthRegistration;
          emit(current.copyWith(loading: true));
          
          String message = await AuthService().sendEmail(current.emailController.text);
          emit((state as AuthRegistration).copyWith(loading: false));
          
          if(message!="error"){
            EasyLoading.showSuccess(message);
            emit(OpeanSuccesCode(email: current.emailController.text));
            await Future.delayed(Duration(milliseconds: 200));
            add(OTPCode());
          }  
        }
      }
    });
    /// AuthLogin service
    
    /// auth login and auth registration checked 
    on<ChekedEvent>((event, emit){
       if(state is AuthLogin){
        emit((state as AuthLogin).copyWith(checked: event.check));
       }else if(state is AuthRegistration){
        emit((state as AuthRegistration).copyWith());
        emit((state as AuthRegistration).copyWith(checked: event.check));
       }
    });
    
    /// auth registration verify Code service
    on<VerifyCodeConfirm>((event, emit)async{
      emit((state as OpeanSuccesCode).copyWith(loading: true));
      
      String message = await AuthService().verifyCode(event.email, event.code);
      (state as OpeanSuccesCode).stream!.cancel();
      emit((state as OpeanSuccesCode).copyWith(loading: false,stream: null));
      if(message!="error"){
        EasyLoading.showSuccess(message);
        emit(CreateUser(code: event.code));
      }
    });

    /// create user passwords visible
    on<CreateUserPasswordVisible>((event, emit) {
      final current = state as CreateUser;
      emit(current.copyWith(
        visibility: event.type==1?!current.visibility:current.visibility,
        visibility1: event.type==2?!current.visibility1:current.visibility1
        ));
    });

    /// create user gender select
    on<GenderSelect>((event, emit) {
      final current = state as CreateUser;
      emit(current.copyWith(genderType: event.genderType));
    });

    on<GoogleEvent>((event, emit) {
      
    });

    /// OTP code verification 
    on<OTPCode>((event, emit) {
      final current = state as OpeanSuccesCode;
      current.stream = Helper().timerStream(current.time).listen((newTime) {
        add(UpdateTime(newTime: newTime));
      });
    });

    on<UpdateTime>((event, emit) {
      final current = state as OpeanSuccesCode;
      emit(current.copyWith(time: event.newTime));
     });


    /// create user service 
    on<CreateUserEvent>((event, emit)async{
      final current = state as CreateUser;
      emit(current.copyWith(loading: true));
      String message = await AuthService().createUser(await current.toFormData(current.code, current.emailController.text));
      emit(current.copyWith(loading: false));
      if(message!="error"){
        EasyLoading.showSuccess(message);
      }
    });

    /// choose user picture
    on<GetUserImage>((event, emit)async{
       XFile? photo;
       emit(((state as CreateUser).copyWith(loading: true)));
      
      if(event.selectType==1){
         photo = await Helper().pickImage(ImageSource.gallery);
      }else if(event.selectType == 2){
         photo = await Helper().pickImage(ImageSource.camera);
      }
      
      emit((state as CreateUser).copyWith(userImage: photo,loading: false));
    });    
  }
}