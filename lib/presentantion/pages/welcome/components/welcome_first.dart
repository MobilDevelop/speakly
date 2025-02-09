import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';
import 'package:speakly/presentantion/components/button/main_button.dart';

class WelcomeFirstView extends StatelessWidget {
  const WelcomeFirstView({
    super.key, required this.press,
  });
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.h10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Speakly",style: AppTheme.data.textTheme.displayLarge!.copyWith(fontSize: ScreenSize.sp30)),
          
          Gap(ScreenSize.h50),
          SizedBox(
            width: double.infinity,
            child: Image.asset(AppIcons.back2)),
      
            Gap(ScreenSize.h15),
            Text("Start chatting with Speakly now. You can ask me anything.",
             textAlign: TextAlign.center,
             style:AppTheme.data.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w500)),
    
             Gap(ScreenSize.h50),
             MainButton(text: "Next",
              borderRadius: ScreenSize.r30,
              onPressed: press)
        ],
      ),
    );
  }
}