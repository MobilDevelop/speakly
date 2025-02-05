import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:speakly/application/intro/intro_cubit.dart';
import 'package:speakly/application/intro/intro_state.dart';
import 'package:speakly/presentantion/assets/res/app_icons.dart';
import 'package:speakly/presentantion/assets/res/screen_size.dart';
import 'package:speakly/presentantion/assets/theme/app_theme.dart';
import 'package:speakly/presentantion/components/button/main_button.dart';
import 'package:speakly/presentantion/routes/index_routes.dart';

import 'components/indicator.dart';
import 'components/shader_image.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.colors.white,
        body: BlocProvider(
          create: (context) => IntroCubit(),
          child: BlocConsumer<IntroCubit, IntroState>(
            listener: (context, state) {
              if(state  is IntroNextAuth){
                context.go(Routes.auth.path);
              }
            },
            builder: (context, state) {
              if(state is IntroInitial){
                return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: PageView(
                      controller: state.pagecontroller,
                      onPageChanged: (value) => context.read<IntroCubit>().setPage(value),
                      children: [
                        ShaderImage(image: AppIcons.intro1,title: "",desc: ""),
                        ShaderImage(image: AppIcons.intro2,title: "",desc: ""),
                        ShaderImage(image: AppIcons.intro3,title: "",desc: ""),
                      ],
                    ),
                  ),
                  
                  Gap(ScreenSize.h10),
                  AnimatedIndicator(index: state.index),
                  
                  Gap(ScreenSize.h20),
                  Container(
                    height: ScreenSize.h1,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: ScreenSize.h24),
                    color: AppTheme.colors.backcolor,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: ScreenSize.h10),
                    child: Row(
                      children: [
                        Expanded(
                            child: MainButton(
                                text: "Skip",
                                color: AppTheme.colors.greysoft,
                                textColor: AppTheme.colors.primary,
                                borderRadius: ScreenSize.r25,
                                onPressed: () {})),
                        Gap(ScreenSize.h10),
                        Expanded(
                            child: MainButton(
                                text: state.index==2?"Get started":"Next",
                                color: AppTheme.colors.primary,
                                borderRadius: ScreenSize.r25,
                                onPressed: ()=>context.read<IntroCubit>().nextPage()))
                      ],
                    ),
                  ),
                  Gap(ScreenSize.h25)
                ],
              );
              }
              return Container();
            },
          ),
        ));
  }
}
