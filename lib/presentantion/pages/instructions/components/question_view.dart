import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:speakly/infrastructure/helper/helper.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';
import 'package:speakly/presentantion/pages/instructions/components/mic_button.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({
    super.key, required this.close, required this.micPress, required this.enableMic, required this.isSpeech, required this.time,
  });
   final VoidCallback close;
   final VoidCallback micPress;
   final bool enableMic;
   final bool isSpeech;
   final int time;
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
              height: 220,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: ScreenSize.h10),
              decoration: BoxDecoration(
                color: AppTheme.colors.primary
              ),
            ),

            SizedBox.shrink(),
            SizedBox.shrink(),

             time!=0? Column(
               children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: ScreenSize.h15),
                    child: LinearProgressIndicator(
                    value: time/60,
                    backgroundColor: AppTheme.colors.secondary,
                    color: AppTheme.colors.white,
                    minHeight: ScreenSize.h8,
                    borderRadius: BorderRadius.circular(ScreenSize.r15),
                      ),
                  ),
                 Gap(ScreenSize.h5),
                 Text(Helper.timeFormat(time),style: AppTheme.data.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w500,color: AppTheme.colors.white)),
               ],
             ):Visibility(
              visible: !isSpeech,
              child: MicButton(
                enableMic: enableMic,
                isSpeech: isSpeech,
                micPress: micPress,
              ),
            ),
    
            SizedBox.shrink(),
            SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}