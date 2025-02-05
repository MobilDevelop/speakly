import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speakly/application/auth/auth_bloc.dart';
import 'package:speakly/application/auth/auth_event.dart';
import 'package:speakly/application/auth/auth_state.dart';
import 'package:speakly/presentantion/assets/theme/app_theme.dart';

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
                  return LoginView();
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
}

