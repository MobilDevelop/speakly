import 'package:flutter/material.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';

class PasswordText extends StatelessWidget {
  const PasswordText({super.key, required this.passwordController, required this.visible, required this.eyePress, required this.title});
  final String title;
  final TextEditingController passwordController;
  final bool visible;
  final VoidCallback eyePress;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(" $title",style: AppTheme.data.textTheme.bodyMedium!.copyWith(fontSize: ScreenSize.sp12,fontWeight: FontWeight.w700)),
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
                    hintText: title,
                    hintStyle: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.grey1,fontWeight: FontWeight.w500)
                  ),
                ),
              ),
              IconButton(onPressed:eyePress, 
              icon: Icon(visible?Icons.visibility:Icons.visibility_off,color: AppTheme.colors.grey1,size: ScreenSize.h20)),
            ],
          ),
          Container(height: 1,width: double.infinity,color: AppTheme.colors.primary),
      ],
    );
  }
}