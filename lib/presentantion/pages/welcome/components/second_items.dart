import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:speakly/domain/common/constants.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';

class SecondItems extends StatelessWidget {
  const SecondItems({
    super.key, required this.title, required this.isSelect, required this.press,
  });
  final String title;
  final bool isSelect;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: Duration(milliseconds: AppContatants.duration),
      onTap: press,
      child: Container(
        height: ScreenSize.h40,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(vertical: ScreenSize.h3),
        padding: EdgeInsets.only(left: ScreenSize.h8),
        decoration: BoxDecoration(
          color: isSelect? AppTheme.colors.primary:AppTheme.colors.white,
          borderRadius: BorderRadius.circular(ScreenSize.r10)
        ),
        child: Text(title,
        style:AppTheme.data.textTheme.headlineMedium!.copyWith(color: isSelect?AppTheme.colors.white:AppTheme.colors.black)),
      ),
    );
  }
}