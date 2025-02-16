import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:speakly/infrastructure/helper/helper.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';
import 'package:speakly/presentantion/components/button/main_button.dart';

class ExamStartView extends StatelessWidget {
  const ExamStartView({super.key, required this.close, required this.title, required this.desc, required this.startPress});
    
    final String title;
    final String desc;
    final VoidCallback close;
    final VoidCallback startPress;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(top: ScreenSize.h5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                onPressed: close, 
                icon: Icon(Icons.arrow_back_ios_new_outlined,color: AppTheme.colors.white)),

                Image.asset(AppIcons.logoW,height: ScreenSize.h28),

                SizedBox.shrink(),
                SizedBox.shrink(),
              ],
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: ScreenSize.h15),
              padding: EdgeInsets.symmetric(horizontal: ScreenSize.h10,vertical: ScreenSize.h12),
              decoration: BoxDecoration(
                color: AppTheme.colors.secondary,
                borderRadius: BorderRadius.circular(ScreenSize.r10)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: AppTheme.data.textTheme.displayLarge!.copyWith(color: AppTheme.colors.white,fontSize: ScreenSize.sp18)),
                  
                  Gap(ScreenSize.h8),
                  Text(Helper.cleanText(desc),style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.white,fontSize: ScreenSize.sp13,height: 1.5.h)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenSize.h30),
              child: MainButton(
                text: "Start", 
                color: AppTheme.colors.secondary,
                borderRadius: ScreenSize.r25,
                onPressed: startPress),
            ),
    
            SizedBox.shrink()  
          ],
        ),
      ),
    );
  }
}