import 'package:flutter/material.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';
import 'package:speakly/presentantion/pages/instructions/components/mic_button.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({
    super.key, required this.close,
  });
   final VoidCallback close;
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

            MicButton(),
    
            SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}