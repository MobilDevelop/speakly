import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({
    super.key, required this.title, required this.hint, required this.controller, required this.icon, this.eyeShow, this.eyePress, this.keyboardType,
  });
  final String title;
  final String hint;
  final String icon;
  final bool? eyeShow;
  final TextInputType? keyboardType;
  final VoidCallback? eyePress;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        labelText: title,
        hintText: hint,
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenSize.h10),
          child: SvgPicture.asset(icon,height: ScreenSize.h10,color: AppTheme.colors.grey1),
        ),
        suffixIcon: eyeShow!=null?IconButton(
          icon: Icon(eyeShow!?Icons.visibility_outlined:Icons.visibility_off_outlined,color: AppTheme.colors.grey),
          onPressed: eyePress):SizedBox.shrink(),
        floatingLabelStyle: AppTheme.data.textTheme.labelLarge!.copyWith(color: AppTheme.colors.primary),
        labelStyle: AppTheme.data.textTheme.bodyMedium,
        hintStyle: AppTheme.data.textTheme.bodySmall!.copyWith(color: AppTheme.colors.grey),
        contentPadding: EdgeInsets.symmetric(horizontal: ScreenSize.h18,vertical: ScreenSize.h12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenSize.r15),
          borderSide: BorderSide(color: AppTheme.colors.grey1)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenSize.r15),
          borderSide: BorderSide(color: AppTheme.colors.primary)
        )
      ),
    );
  }
}