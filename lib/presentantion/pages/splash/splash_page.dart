import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speakly/application/splash/splash_cubit.dart';
import 'package:speakly/application/splash/splash_state.dart';
import 'package:speakly/presentantion/assets/res/app_icons.dart';
import 'package:speakly/presentantion/assets/res/screen_size.dart';
import 'package:speakly/presentantion/components/animation_loading/main_loading.dart';
import 'package:speakly/presentantion/routes/index_routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(create: (context) => SplashCubit(),
       child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if(state is SplashNextLogin){
            context.go(Routes.auth.path);
          }else if(state is SplashNextIntro){
            context.go(Routes.intro.path);
          }else if(state is SplashNextHome){
            
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Container(),
             Image.asset(AppIcons.back),
             Container(
               padding: EdgeInsets.only(bottom: ScreenSize.h70),
               child: LoadingAnimation(),
              ),
            ],
          );
        },
       ),
      )
    );
  }
}