import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:speakly/domain/common/constants.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';

class TestButton extends StatelessWidget {
  const TestButton({
    super.key, required this.title, required this.press,
  });
  final String title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: Duration(milliseconds: AppContatants.duration),
      onTap: press,
      child: Container(
        height: ScreenSize.h50,
        width: double.infinity,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: ScreenSize.h25),
        decoration: BoxDecoration(
          color: AppTheme.colors.secondary,
          border: Border.all(color: AppTheme.colors.primary),
          borderRadius: BorderRadius.circular(ScreenSize.r10)
        ),
        child: Text(title, style: AppTheme.data.textTheme.displayLarge!.copyWith(color: AppTheme.colors.white)),
      ),
    );
  }
}