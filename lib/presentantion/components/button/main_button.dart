import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.showLoading = false,
    this.margin,
    this.leftIcon,
    this.borderRadius,
    this.wrap = false,  this.color,  this.textColor,
  });

  final String text;
  final String? leftIcon;
  final VoidCallback onPressed;
  final bool showLoading;
  final bool wrap;
  final EdgeInsets? margin;
  final Color? color;
  final Color? textColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    Widget current;

    if (showLoading) {
      current = LoadingAnimationWidget.fallingDot(
        color: AppTheme.colors.white,
        size: 36.h,
      );
    } else if (leftIcon != null) {
      current = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(leftIcon!,color: textColor??AppTheme.colors.white,height: ScreenSize.h24),
          Gap(ScreenSize.w10),
          Text(
            text,
            style: AppTheme.data.textTheme.bodyLarge?.copyWith(color: textColor?? AppTheme.colors.white, 
            fontSize: ScreenSize.sp14,fontWeight: FontWeight.w600),
          )
        ],
      );
    } else {
      current = Text(
        text,
        style: AppTheme.data.textTheme.bodyLarge?.copyWith(color: textColor?? AppTheme.colors.white, fontSize: ScreenSize.sp14),
      );
    }

    return Bounce(
      onTap:  onPressed,
      duration: Duration(milliseconds:250),
      scaleFactor: (color == AppTheme.colors.grey || showLoading)?1:0.96,
      tilt: (color == AppTheme.colors.grey || showLoading)?false:true,
      child: Container(
        width: wrap ? null : double.maxFinite,
        height: wrap ? null : ScreenSize.h45,
        alignment: Alignment.center,
        padding: wrap
            ? EdgeInsets.symmetric(
                horizontal: ScreenSize.w16,
                vertical: ScreenSize.h8,
              )
            : EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius??ScreenSize.r15),
          color: color ?? AppTheme.colors.secondary,
          boxShadow: [
            BoxShadow(
              color: AppTheme.colors.black.withOpacity(.09),
              blurRadius: 10,
              spreadRadius: 4,
              offset: Offset(0, 7.h)
            )
          ],
        ),
        margin: margin,
        child: current,
      ),
    );
  }
}