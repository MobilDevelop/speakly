import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:speakly/domain/common/constants.dart';
import 'package:speakly/presentantion/assets/res/app_icons.dart';
import 'package:speakly/presentantion/assets/res/screen_size.dart';
import 'package:speakly/presentantion/assets/theme/app_theme.dart';
import 'package:speakly/presentantion/components/button/main_button.dart';
import 'package:speakly/presentantion/pages/auth/components/password_text.dart';

class CreateUserView extends StatelessWidget {
  const CreateUserView({
    super.key, required this.fullNameController, required this.passwordController, required this.visible,required this.visible1, required this.genderSelect,
    required this.visiblePress, required this.successPress, required this.confirmPasswordController, required this.phoneController, required this.genderType, 
    required this.selectNumber,required this.selectImage,this.userImage
  });
  final TextEditingController fullNameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;

  final XFile? userImage;
  
  final bool visible;
  final bool visible1;

  final int genderType;

  final Function visiblePress;
  final Function genderSelect;
  
  final VoidCallback successPress;
  final VoidCallback selectNumber;
  final VoidCallback selectImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.h10),
      child: ListView(
        padding: EdgeInsets.only(bottom: ScreenSize.h10),
        children: [
          Gap(ScreenSize.h30),
          Text("Complete your profile 📋",style: AppTheme.data.textTheme.displayLarge!.copyWith(fontSize: ScreenSize.sp24)),
          Gap(ScreenSize.h10),
          Text("Please enter your profile. Don't worry, only you can see your personal data. No one else will be able to see it. Or you can skip it for now.",
          style: AppTheme.data.textTheme.titleSmall),

          Gap(ScreenSize.h10),
          Center(
            child: Stack(
                    children: [
             userImage!=null?ClipRRect(
                    borderRadius: BorderRadius.circular(60.r),
                    child: Image.file(File(userImage!.path),
                        fit: BoxFit.cover, height: 90.h, width: 90.h),
              ):Image.asset(AppIcons.user,fit: BoxFit.fill),
               Positioned(
                bottom: ScreenSize.h5,
                right: 0,
                child: GestureDetector(
                    onTap: selectImage,
                    child: Container(
                      padding: EdgeInsets.all(ScreenSize.h2),
                      decoration: BoxDecoration(
                        color: AppTheme.colors.primary,
                        borderRadius: BorderRadius.circular(ScreenSize.r7)
                      ),
                      child: Icon(Icons.edit_rounded,color: AppTheme.colors.white)))),
                    ],
                  ),
          ),

          Gap(ScreenSize.h20),
          Text(" Full name",style: AppTheme.data.textTheme.bodyMedium!.copyWith(fontSize: ScreenSize.sp12,fontWeight: FontWeight.w700)),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: fullNameController,
                  style: AppTheme.data.textTheme.titleSmall,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: ScreenSize.h4),
                    hintText: "Full name",
                    hintStyle: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.grey1,fontWeight: FontWeight.w500)
                  ),
                ),
              ),
              SvgPicture.asset(AppIcons.email,color: AppTheme.colors.grey1),
              Gap(ScreenSize.h6)
            ],
          ),
          Container(height: 1,width: double.infinity,color: AppTheme.colors.primary),

         Gap(ScreenSize.h25),
         PasswordText(
          title: "Password",
          passwordController: passwordController, 
          visible: visible, 
          eyePress:()=>visiblePress(1)),

          Gap(ScreenSize.h25),
          PasswordText(
          title: "Confirm password",
          passwordController: confirmPasswordController, 
          visible: visible1, 
          eyePress:()=>visiblePress(2)),
          

          Gap(ScreenSize.h25),
          Text(" Phone number",style: AppTheme.data.textTheme.bodyMedium!.copyWith(fontSize: ScreenSize.sp12,fontWeight: FontWeight.w700)),
          Row(
            children: [
              GestureDetector(
                onTap: selectNumber,
                child: Container(
                  height: ScreenSize.h30,
                  child: Row(
                    children: [
                      Image.asset(AppIcons.ubzFlag,height: ScreenSize.h14),
                      Gap(ScreenSize.h4),
                      Text("+998",style: AppTheme.data.textTheme.bodyMedium),
                      Icon(Icons.expand_more)
                    ],
                  ),
                ),
              ),
              Gap(ScreenSize.h2),
              Expanded(
                child: TextField(
                  controller: phoneController,
                  style: AppTheme.data.textTheme.titleSmall,
                  keyboardType: TextInputType.phone,
                  obscureText: !visible,
                  obscuringCharacter: "●",
                  inputFormatters: [
                    MaskTextInputFormatter(mask: '(##) ###-##-##',filter: {"#": RegExp(r'[0-9]')},type: MaskAutoCompletionType.lazy)
                    ],
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: ScreenSize.h4),
                    hintText: "(##) ###-##-##",
                    hintStyle: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.grey1,fontWeight: FontWeight.w500)
                  ),
                ),
              ),
            ],
          ),
          Container(height: 1,width: double.infinity,color: AppTheme.colors.primary),

          Gap(ScreenSize.h20),
          Text(" Gender",style: AppTheme.data.textTheme.bodyMedium!.copyWith(fontSize: ScreenSize.sp12,fontWeight: FontWeight.w700)),
          Container(
            height: ScreenSize.h45,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppTheme.colors.primary))
            ),
            child: Row(
              children: [
                Expanded(child: GestureDetector(
                  onTap:()=>genderSelect(1),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: AppContatants.duration),
                    height: ScreenSize.h35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: genderType == 1? AppTheme.colors.primary:AppTheme.colors.backcolor,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(ScreenSize.r10))
                    ),
                    child: Text("Male",style: AppTheme.data.textTheme.bodyMedium!.copyWith(color:genderType == 1? AppTheme.colors.white:AppTheme.colors.black)),
                    ),
                )),

                  Gap(ScreenSize.h5),
                  Expanded(child: GestureDetector(
                    onTap:()=>genderSelect(2),
                    child: AnimatedContainer(
                    duration: Duration(milliseconds: AppContatants.duration),
                    height: ScreenSize.h35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: genderType == 2? AppTheme.colors.primary:AppTheme.colors.backcolor,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(ScreenSize.r10))
                    ),
                    child: Text("Famele",style: AppTheme.data.textTheme.bodyMedium!.copyWith(color:genderType == 2? AppTheme.colors.white:AppTheme.colors.black)),
                    ),
                  ))
              ],
            ),
          ),

           Gap(ScreenSize.h25),
           MainButton(
            text: "Continue", 
            borderRadius: ScreenSize.r25,
            onPressed: successPress),
               
        ],
      ),
    );
  }
}