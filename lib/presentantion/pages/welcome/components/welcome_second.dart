import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';
import 'package:speakly/presentantion/components/button/main_button.dart';

import 'second_items.dart';

class WelcomeSecondView extends StatelessWidget {
  const WelcomeSecondView({
    super.key, required this.index, required this.press, required this.successPress,
  });
  final int index;
  final Function press;
  final VoidCallback successPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.h10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("How long until you take the ILTS exam?",
          textAlign: TextAlign.center,
          style: AppTheme.data.textTheme.displayLarge!.copyWith(fontSize: ScreenSize.sp25)),
          
           Gap(ScreenSize.h50),
           Column(
            children: [
              SecondItems(
                isSelect: index==1,
                title: "1-2 month",
                press: () => press(1),
              ),
              SecondItems(
                isSelect: index==2,
                title: "3-4 month",
                press: () => press(2),
              ),
              SecondItems(
                isSelect: index==3,
                title: "5-6 month",
                press: () => press(3),
              ),
              SecondItems(
                isSelect: index==4,
                title: "7-8 month",
                press: () => press(4),
              )
            ],
           ),
      
            Gap(ScreenSize.h15),
            Text("Start chatting with Speakly now. You can ask me anything.",
             textAlign: TextAlign.center,
             style:AppTheme.data.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w500)),
    
             Gap(ScreenSize.h50),
             MainButton(text: "Continue",
              borderRadius: ScreenSize.r30,
              onPressed: successPress)
        ],
      ),
    );
  }
}