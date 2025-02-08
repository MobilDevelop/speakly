import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:speakly/presentantion/assets/res/screen_size.dart';
import 'package:speakly/presentantion/assets/theme/app_theme.dart';
import 'package:speakly/presentantion/components/animation_loading/main_loading.dart';

class CodeSuccess extends StatelessWidget {
  const CodeSuccess({super.key, required this.email, required this.time, required this.loading, required this.onCompleted});
  final String email;
  final String time;
  final bool loading;
  final Function onCompleted;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: ScreenSize.h10),
          child: Column(
            children: [
              Gap(ScreenSize.h30),
              Text("OTP code verification 🔐",style: AppTheme.data.textTheme.displayLarge!.copyWith(fontSize: ScreenSize.sp30)),
              RichText(text: TextSpan(
                children: [
                  TextSpan(
                    text: "We have sent an OTP code to your email ",
                    style: AppTheme.data.textTheme.titleSmall
                  ),
                  TextSpan(
                    text: "$email. ",
                    style: AppTheme.data.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600,fontSize: ScreenSize.sp16)
                  ),
                  TextSpan(
                    text: "Enter the OTP code below to verify.",
                    style: AppTheme.data.textTheme.titleSmall
                  ),
                ]
              )),
              
              Gap(ScreenSize.h40),
              PinCodeTextField(
                length: 6,
                 cursorWidth: 1,
                 scrollPadding: const EdgeInsets.all(10),
                 keyboardType: TextInputType.number,
                 autoFocus: true,
                 cursorColor: AppTheme.colors.primary,
                 appContext: context,
                 obscureText: false,
                 animationType: AnimationType.fade,
                 pinTheme: PinTheme(
                   shape: PinCodeFieldShape.box,
                   borderRadius: BorderRadius.circular(ScreenSize.r8),
                   activeColor: AppTheme.colors.primary,
                   fieldHeight: ScreenSize.h40,
                   fieldWidth: ScreenSize.h40,
                   activeFillColor:AppTheme.colors.primary.withOpacity(.1),
                   inactiveFillColor:AppTheme.colors.backcolor,
                   selectedFillColor: AppTheme.colors.primary.withOpacity(.3),
                   selectedColor: AppTheme.colors.primary,
                   inactiveColor: AppTheme.colors.grey1),
                 animationDuration: const Duration(milliseconds: 300),
                 enableActiveFill: true,
                 onCompleted:(value)=>onCompleted(value),
              ),
        
            Gap(ScreenSize.h20),
            Text("Didn't receive email?",style: AppTheme.data.textTheme.titleSmall),
        
            Gap(ScreenSize.h20),
            RichText(text: TextSpan(
                children: [
                  TextSpan(
                    text: "You can resend code in: ",
                    style: AppTheme.data.textTheme.titleSmall
                  ),
                  TextSpan(
                    text: time,
                    style: AppTheme.data.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600,color: AppTheme.colors.primary)
                  ),
                  
                ]
              )),
            ],
          ),
        ),
        Visibility(
          visible: loading,
          child: LoadingAnimation(isBlur: "on"))
      ],
    );
  }
}