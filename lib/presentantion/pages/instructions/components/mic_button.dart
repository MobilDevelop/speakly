import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speakly/domain/common/constants.dart';
import 'package:speakly/presentantion/assets/res/app_icons.dart';
import 'package:speakly/presentantion/assets/res/screen_size.dart';
import 'package:speakly/presentantion/assets/theme/app_theme.dart';

class MicButton extends StatelessWidget {
  const MicButton({super.key, required this.micPress, required this.enableMic, required this.isSpeech});
  
  final bool enableMic;
  final bool isSpeech;
  final VoidCallback micPress;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: Duration(milliseconds: isSpeech?0:AppContatants.duration),

      onTap: micPress,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 90.h,
            height: 90.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.colors.white.withOpacity(0.05),
            ),
          ),
          Container(
            width: 75.h,
            height: 75.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.colors.white.withOpacity(0.1),
            ),
          ),
          Container(
            width: 60.h,
            height: 60.h,
            padding: EdgeInsets.all(ScreenSize.h12),
            decoration: BoxDecoration(
              border: Border.all(color: enableMic?AppTheme.colors.green3:AppTheme.colors.white.withOpacity(.1)),
              shape: BoxShape.circle,
              color: AppTheme.colors.white.withOpacity(0.14),
            ),
            child: SvgPicture.asset(AppIcons.mic,height: ScreenSize.h10,fit: BoxFit.contain, 
            color: enableMic?AppTheme.colors.green3:AppTheme.colors.white),
          ),
        ],
      ),
    );
  }
}