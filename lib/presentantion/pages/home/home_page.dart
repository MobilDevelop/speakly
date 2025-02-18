import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:speakly/application/home/home_bloc.dart';
import 'package:speakly/application/home/home_state.dart';
import 'package:speakly/presentantion/assets/res/app_icons.dart';
import 'package:speakly/presentantion/assets/res/screen_size.dart';
import 'package:speakly/presentantion/assets/theme/app_theme.dart';
import 'package:speakly/presentantion/components/animation_loading/main_loading.dart';
import 'package:speakly/presentantion/pages/home/components/indicator.dart';
import 'package:speakly/presentantion/routes/index_routes.dart';
import 'components/free_exam.dart';
import 'components/news_items.dart';
import 'components/test_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backcolor,
      appBar: AppBar(
        backgroundColor: AppTheme.colors.white,
        title: Image.asset(AppIcons.logoP,height: ScreenSize.h35),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(left: ScreenSize.h10,right: ScreenSize.h10,top: ScreenSize.h8,bottom: ScreenSize.h70),
            children: [
              SizedBox(
                height: 80.h,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    NewsItems(
                      title: "News",
                      image: AppIcons.image1,
                    ),

                    NewsItems(
                      title: "Challange",
                      image: AppIcons.image2,
                    ),

                    NewsItems(
                      title: "Change",
                      image: AppIcons.image3,
                    ),

                    NewsItems(
                      title: "News",
                      image: AppIcons.image4,
                    ),

                    NewsItems(
                      title: "Change",
                      image: AppIcons.image5,
                    ),
                  ],
                ),
              ),

              Gap(ScreenSize.h5),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if(state is HomeInitial){
                    return Text("Good Morning! ${state.info.fullname} 👋",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.grey));
                  }
                  return SizedBox.shrink();
                },
              ),
              Text("Let’s see what can I do for you?",
              style: AppTheme.data.textTheme.titleMedium),

              Gap(ScreenSize.h10),
              FreeExam(),

              Gap(ScreenSize.h30),
              TestButton(
                title: "Full Speaking Test",
                press: ()=>context.push(Routes.instructions.path,extra: "full_exam"),
              ),
              
              Gap(ScreenSize.h20),
              TestButton(
                title: "Mini Speaking Test",
                press: ()=>context.push(Routes.instructions.path,extra: "mini_exam"),
              ),

              Gap(ScreenSize.h20),
              Text("  Last Resoult",style: AppTheme.data.textTheme.titleSmall),
              Gap(ScreenSize.h5),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if(state is HomeInitial){
                    return Container(
                     width: double.infinity,
                     padding: EdgeInsets.symmetric(vertical: ScreenSize.h14),
                     decoration: BoxDecoration(
                       color: AppTheme.colors.white,
                       borderRadius: BorderRadius.circular(ScreenSize.r14)
                     ),
                     child: ArcIndicator(
                       value: state.info.score*1.0,
                       color: AppTheme.colors.black,
                       ),
                    );
                  }
                  return SizedBox.shrink();
                 },
              ),
            ],
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) => Visibility(
              visible: state.loading,
              child: LoadingAnimation(
              isBlur: "blur",
            )))
        ],
      )
    );
  }
}