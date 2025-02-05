
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';


class BorderButton extends StatelessWidget {
  const BorderButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.borderColor,
    this.icon,
  });

  final VoidCallback onPressed;
  final String text;
  final double? width;
  final Color? borderColor;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    Widget current = Text(
      text,
      style: AppTheme.data.textTheme.bodyLarge?.copyWith(color: borderColor ?? AppTheme.colors.primary, fontSize: ScreenSize.sp14),
    );
    if (icon != null) {
      current = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          current,
          Gap(text.isEmpty?0:ScreenSize.w12),
          SvgPicture.asset(
            icon!,
            color: borderColor ?? AppTheme.colors.text900,
            height: ScreenSize.h20,
          ),
        ],
      );
    }
    return Bounce(
      onTap: onPressed,
      duration: const Duration(milliseconds: 150),
      child: Container(
        width: width,
        height: 30.h,
        padding: EdgeInsets.symmetric(
          horizontal: icon != null ? ScreenSize.h10 : ScreenSize.w24,
          vertical: ScreenSize.h5),
        decoration: BoxDecoration(
          color: borderColor == null ? AppTheme.colors.primary.withOpacity(0.04) : borderColor!.withOpacity(0.04),
          borderRadius: BorderRadius.circular(ScreenSize.r7),
          border: Border.all(color: borderColor ?? AppTheme.colors.primary, width: 1)),
        alignment: Alignment.center,
        child: current,
      ),
    );
  }
}
