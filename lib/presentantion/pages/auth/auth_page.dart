import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speakly/application/auth/auth_bloc.dart';
import 'package:speakly/application/auth/auth_event.dart';
import 'package:speakly/application/auth/auth_state.dart';
import 'package:speakly/presentantion/assets/theme/app_theme.dart';
import 'package:speakly/presentantion/pages/auth/components/registration_view.dart';
import 'package:speakly/presentantion/pages/auth/components/success_code.dart';
import 'components/login_view.dart';
import 'components/select_auth.dart';

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

             BlocBuilder<AuthBloc,AuthState>(
              builder: (context, state){
                if(state is OpeanSuccesCode){
                  return CodeSuccess();
                }
                return Container();
              }) 
          ],
        ),
      ),
      ),
      ),
    );
  }

 showDoc(context){
  return showModalBottomSheet(context: context, 
  builder: (context) => Container());
 }
}