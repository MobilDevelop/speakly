import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:speakly/presentantion/assets/res/app_icons.dart';
import 'package:speakly/presentantion/assets/res/screen_size.dart';
import 'package:speakly/presentantion/assets/theme/app_theme.dart';
import 'package:speakly/presentantion/pages/home/components/indicator.dart';
import 'package:speakly/presentantion/routes/index_routes.dart';
import 'components/free_exam.dart';
import 'components/news_items.dart';

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
      body: ListView(
        padding: EdgeInsets.only(left: ScreenSize.h10,right: ScreenSize.h10,top: ScreenSize.h8,bottom: ScreenSize.h70),
        children: [
          SizedBox(
            height: 75.h,
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
          Text("Good Morning! Alex 👋",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.grey)),
          Text("Let’s see what can I do for you?",
          style: AppTheme.data.textTheme.titleMedium),

          Gap(ScreenSize.h10),
          FreeExam(),

          Gap(ScreenSize.h30),
          Container(
            height: ScreenSize.h50,
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: ScreenSize.h25),
            decoration: BoxDecoration(
              color: AppTheme.colors.secondary,
              border: Border.all(color: AppTheme.colors.primary),
              borderRadius: BorderRadius.circular(ScreenSize.r10)
            ),
            child: Text("Full Speaking Test", style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.white)),
          ),

          Gap(ScreenSize.h20),
          Container(
            height: ScreenSize.h50,
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: ScreenSize.h25),
            decoration: BoxDecoration(
              color: AppTheme.colors.secondary,
              border: Border.all(color: AppTheme.colors.primary),
              borderRadius: BorderRadius.circular(ScreenSize.r10)
            ),
             child: Text("Mini Speaking Test", style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.white)),
          ),

          Gap(ScreenSize.h20),
          Text("  Last Resoult",style: AppTheme.data.textTheme.titleSmall),
          Gap(ScreenSize.h5),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: ScreenSize.h14),
            decoration: BoxDecoration(
              color: AppTheme.colors.white,
              borderRadius: BorderRadius.circular(ScreenSize.r14)
            ),
            child: ArcIndicator(
              value: 5.5,
              color: AppTheme.colors.black,
              ),
          ),
        ],
      )
    );
  }
}