import 'package:bounce/bounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:speakly/domain/common/constants.dart';
import 'package:speakly/presentantion/assets/res/app_icons.dart';
import 'package:speakly/presentantion/assets/res/screen_size.dart';
import 'package:speakly/presentantion/assets/theme/app_theme.dart';
import 'package:speakly/presentantion/components/button/main_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    super.key, required this.emailController, required this.passwordController, required this.visible, required this.checked, 
    required this.visiblePress, required this.chechPress, required this.loginPress, required this.docPress, 
    required this.googlePress, required this.successPress,required this.errorEmail
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  
  final bool visible;
  final bool checked;
  final bool errorEmail;

  final VoidCallback visiblePress;
  final VoidCallback chechPress;
  final VoidCallback loginPress;
  final VoidCallback docPress;
  final VoidCallback googlePress;
  final VoidCallback successPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.h10),
      child: ListView(
        children: [
          Gap(ScreenSize.h30),
          Text("Welcome back 👋",style: AppTheme.data.textTheme.displayLarge!.copyWith(fontSize: ScreenSize.sp30)),
          Text("Please enter your email & password to log in.",style: AppTheme.data.textTheme.titleSmall),

          Gap(ScreenSize.h30),
          Text(" Email",style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: errorEmail?AppTheme.colors.red:AppTheme.colors.black,fontSize: ScreenSize.sp12,fontWeight: FontWeight.w700)),
          Gap(ScreenSize.h5),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: emailController,
                  style: AppTheme.data.textTheme.titleSmall!.copyWith(color: errorEmail?AppTheme.colors.red:AppTheme.colors.black),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: ScreenSize.h4),
                    hintText: "Email",
                    hintStyle: AppTheme.data.textTheme.titleLarge!.copyWith(color: AppTheme.colors.grey1,fontWeight: FontWeight.w700)
                  ),
                ),
              ),
              SvgPicture.asset(AppIcons.email,color: errorEmail?AppTheme.colors.red:AppTheme.colors.grey1),
              Gap(ScreenSize.h6)
            ],
          ),
          Container(height: 1,width: double.infinity,color: errorEmail?AppTheme.colors.red:AppTheme.colors.primary),

         Gap(ScreenSize.h25),
          Text(" Password",style: AppTheme.data.textTheme.bodyMedium!.copyWith(fontSize: ScreenSize.sp12,fontWeight: FontWeight.w700)),
          Gap(ScreenSize.h5),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: passwordController,
                  style: AppTheme.data.textTheme.titleSmall,
                  keyboardType: TextInputType.text,
                  obscureText: !visible,
                  obscuringCharacter: "●",
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: ScreenSize.h4),
                    hintText: "Password",
                    hintStyle: AppTheme.data.textTheme.titleLarge!.copyWith(color: AppTheme.colors.grey1,fontWeight: FontWeight.w700)
                  ),
                ),
              ),
              IconButton(onPressed:visiblePress, 
              icon: Icon(visible?Icons.visibility:Icons.visibility_off,color: AppTheme.colors.grey1,size: ScreenSize.h20)),
            ],
          ),
          Container(height: 1,width: double.infinity,color: AppTheme.colors.primary),

          Gap(ScreenSize.h20),
          Row(
            children: [
              IconButton(onPressed: chechPress, icon: SvgPicture.asset(checked?AppIcons.checkOn:AppIcons.checkOff)),
              Gap(ScreenSize.h7),
              Expanded(
                child: InkWell(
                  onTap: docPress,
                  child: RichText(
                      text: TextSpan(
                      children: [
                        TextSpan(
                          text: "I agree to Speakly ",
                          style: AppTheme.data.textTheme.bodyLarge
                        ),
                        TextSpan(
                          text: " Public Agreement, Terms, & Privacy Policy.",
                          style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.primary)
                        )
                      ]
                    )),
                ),
              ),
            ],
          ),

          Gap(ScreenSize.h20),
          Container(height: 1,width: double.infinity, color: AppTheme.colors.greysoft),

          Gap(ScreenSize.h20),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
              children: [
                TextSpan(
                  text: "Don't have an account?  ",
                  style: AppTheme.data.textTheme.bodyLarge
                ),
                TextSpan(
                  text: " Sign up",
                  style: AppTheme.data.textTheme.titleMedium!.copyWith(color: AppTheme.colors.primary),
                  recognizer: TapGestureRecognizer()..onTap =()=>loginPress()
                )
              ]
            )),
          ),

          Gap(ScreenSize.h20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Container(height: 1,color: AppTheme.colors.greysoft)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: ScreenSize.h15),
                child: Text("or continue with",style: AppTheme.data.textTheme.bodyLarge)),
              Expanded(child: Container(height: 1,color: AppTheme.colors.greysoft)),
            ],
          ),

          Gap(ScreenSize.h20),
          Bounce(
            duration: Duration(milliseconds: AppContatants.duration),
            onTap: googlePress,
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: ScreenSize.h30,vertical: ScreenSize.h10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenSize.r25),
                border: Border.all(color: AppTheme.colors.greysoft)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppIcons.google),
                  Gap(ScreenSize.h10),
                  Text("Google",style: AppTheme.data.textTheme.titleMedium)
                ],
              )),
          ),

           Gap(ScreenSize.h30),
           Container(height: 1,width: double.infinity, color: AppTheme.colors.greysoft), 

           Gap(ScreenSize.h25),
           MainButton(
            text: "Continue", 
            borderRadius: ScreenSize.r25,
            onPressed: successPress)
            
        ],
      ),
    );
  }
}