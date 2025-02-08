import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speakly/application/auth/auth_bloc.dart';
import 'package:speakly/application/auth/auth_event.dart';
import 'package:speakly/application/auth/auth_state.dart';
import 'package:speakly/domain/common/constants.dart';
import 'package:speakly/infrastructure/helper/helper.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';
import 'package:speakly/presentantion/components/animation_loading/main_loading.dart';
import 'package:speakly/presentantion/pages/auth/components/create_user.dart';
import 'package:speakly/presentantion/pages/auth/components/registration_view.dart';
import 'package:speakly/presentantion/pages/auth/components/success_code.dart';
import 'components/login_view.dart';
import 'components/select_auth.dart';
import 'components/select_image_type.dart';
import 'components/select_number.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: BlocProvider(create: (context) => AuthBloc(),
      child: BlocListener<AuthBloc,AuthState>(listener: (context, state){

      },
      child: SafeArea(
        child: Stack(
          children: [
            /// choose auth view 
            BlocBuilder<AuthBloc,AuthState>(
              builder: (context, state){
                if(state is AuthInitial){
                  return SelectAuth(
                    loginPress: ()=>context.read<AuthBloc>().add(LoginEvent()),
                    registrationPress: () => context.read<AuthBloc>().add(RegistrationEvent()),
                  );
                }
                return Container();
              }),
            /// choose auth view   

            /// auth login view
            BlocBuilder<AuthBloc,AuthState>(
              builder: (context, state){
                if(state is AuthLogin){
                  final bloc= context.read<AuthBloc>();
                  return LoginView(
                    emailController: state.emailController,
                    passwordController: state.passwordController,
                    
                    checked: state.checked,
                    visible: state.visibility,
                    errorEmail: state.errorEmail,
                    
                    visiblePress: ()=>bloc.add(PasswordVisibleEvent(visible: !state.visibility)),
                    chechPress: ()=>bloc.add(ChekedEvent(check: !state.checked)),
                    loginPress: ()=>bloc.add(RegistrationEvent()),
                    successPress: ()=>bloc.add(AuthSuccessEvent(type: 1,text: state.emailController.text)),
                    googlePress: ()=>bloc.add(GoogleEvent()),
                    docPress: ()=>showDoc(context),
                  );
                }
                return Container();
              }),
            /// auth login view
             
             /// auth registration view
             BlocBuilder<AuthBloc,AuthState>(
              builder: (context, state){
               if(state is AuthRegistration){
                final bloc= context.read<AuthBloc>();
                return RegistrationView(
                  emailController: state.emailController, 
                  
                  checked: state.checked,
                  errorEmail: state.errorEmail,
                  
                  chechPress: ()=>bloc.add(ChekedEvent(check: !state.checked)), 
                  loginPress: ()=>bloc.add(LoginEvent()), 
                  googlePress: ()=>bloc.add(GoogleEvent()), 
                  successPress: ()=>bloc.add(AuthSuccessEvent(type: 2,text: state.emailController.text)), 
                  docPress: ()=>showDoc(context)
                  );
               }
               return Container();
             }),
             /// auth registration view
             
             /// auth registration success code view
             BlocBuilder<AuthBloc,AuthState>(
              builder: (context, state){
                if(state is OpeanSuccesCode){
                  return CodeSuccess(
                    email: state.email,
                    loading: state.loading,
                    onCompleted:(code)=>context.read<AuthBloc>().add(VerifyCodeConfirm(email: state.email, code: code)),
                    time: Helper.timeFormat(state.time));
                }
                return Container();
              }),
             /// auth registration success code view  

             /// auth create user
           BlocBuilder<AuthBloc,AuthState>(builder: (context, state) {
             if(state is CreateUser){
              return CreateUserView(
                fullNameController: state.fullNameController,
                passwordController: state.passwordController,
                confirmPasswordController: state.confirmPasswordController,
                phoneController: state.phoneController,
                
                visible: state.visibility,
                visible1: state.visibility1,

                genderType: state.genderType,
                userImage: state.userImage,
                
                visiblePress: (type)=>context.read<AuthBloc>().add(CreateUserPasswordVisible(type: type)),
                genderSelect: (gender) =>context.read<AuthBloc>().add(GenderSelect(genderType: gender)),
                successPress: ()=>context.read<AuthBloc>().add(CreateUserEvent()),
                selectNumber: () => showSelectNumber(context),
                selectImage: () => showImageType(context).then((value) => context.read<AuthBloc>().add(GetUserImage(selectType: value!)))
              );
             }
             return Container();
           }),

           /// all auth view loading animations
            BlocBuilder<AuthBloc,AuthState>(
              builder: (context, state){
                  return state.loading? LoadingAnimation(isBlur: "on"):SizedBox.shrink();
              }),
            /// all auth view loading animations
          ],
        ),
      ),
      ),
      ),
    );
  }

 showDoc(context){
  return showModalBottomSheet(context: context, 
  sheetAnimationStyle: AnimationStyle(curve: Curves.easeIn,duration: Duration(milliseconds: AppContatants.duration)),
  builder: (context) => Container());
 }

 showSelectNumber(context){
  return showModalBottomSheet(context: context,
  sheetAnimationStyle: AnimationStyle(curve: Curves.easeIn,duration: Duration(milliseconds: AppContatants.duration)),
  builder: (context) => SelectNumberView());
 }

 Future<int?> showImageType(context)async{
  return showModalBottomSheet<int>(context: context, 
  sheetAnimationStyle: AnimationStyle(curve: Curves.easeIn,duration: Duration(milliseconds: AppContatants.duration)),
  builder: (context) => SelectImageType()).then((value) => value ?? -1);
 }
}