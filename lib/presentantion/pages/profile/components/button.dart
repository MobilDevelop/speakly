import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:speakly/domain/common/constants.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key, this.textcolor, required this.title, required this.press,
  });
  final Color? textcolor;
  final String title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: Duration(milliseconds: AppContatants.duration),
      onTap: press,
      child: Container(
        height: ScreenSize.h40,
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: ScreenSize.h4),
        padding: EdgeInsets.symmetric(horizontal: ScreenSize.h10),
        decoration: BoxDecoration(
          color: AppTheme.colors.white,
          borderRadius: BorderRadius.circular(ScreenSize.r10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: AppTheme.data.textTheme.titleSmall!.copyWith(color: textcolor)),
            Icon(Icons.arrow_forward_ios,size: ScreenSize.h15)
          ],
        ),
      ),
    );
  }
}