import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';
import 'package:speakly/presentantion/components/button/main_button.dart';

class SelectAuth extends StatelessWidget {
  const SelectAuth({
    super.key, required this.loginPress, required this.registrationPress,
  });
  final VoidCallback loginPress;
  final VoidCallback registrationPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.h10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppIcons.back2),
          
          Gap(ScreenSize.h70),
          Gap(ScreenSize.h50),
          MainButton(
            text: "Log in", 
            borderRadius: ScreenSize.r30,
            onPressed: loginPress),
    
          Gap(ScreenSize.h20),
          MainButton(
            text: "Sign up",
            textColor: AppTheme.colors.primary,
            color: AppTheme.colors.backcolor, 
            borderRadius: ScreenSize.r30,
            onPressed: registrationPress)
    
        ],
      ),
    );
  }
}