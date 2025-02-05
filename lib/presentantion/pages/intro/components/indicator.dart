import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:speakly/domain/common/constants.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';

class AnimatedIndicator extends StatelessWidget {
  const AnimatedIndicator({
    super.key, required this.index,
  });
   final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: AppContatants.duration),
          height: ScreenSize.h8,
          width: index == 0? ScreenSize.h45:ScreenSize.h8,
          decoration: BoxDecoration(
            color: index == 0? AppTheme.colors.primary:AppTheme.colors.greysoft,
            borderRadius: BorderRadius.circular(ScreenSize.r10)
          ),
        ),
    
        Gap(ScreenSize.h8),
        AnimatedContainer(
          duration: Duration(milliseconds: AppContatants.duration),
          height: ScreenSize.h8,
          width: index == 1? ScreenSize.h45:ScreenSize.h8,
          decoration: BoxDecoration(
            color: index == 1? AppTheme.colors.primary:AppTheme.colors.greysoft,
            borderRadius: BorderRadius.circular(ScreenSize.r10)
          ),
        ),
    
        Gap(ScreenSize.h8),
        AnimatedContainer(
          duration: Duration(milliseconds: AppContatants.duration),
          height: ScreenSize.h8,
          width: index == 2? ScreenSize.h45:ScreenSize.h8,
          decoration: BoxDecoration(
            color: index == 2? AppTheme.colors.primary:AppTheme.colors.greysoft,
            borderRadius: BorderRadius.circular(ScreenSize.r10)
          ),
        ),
      ],
    );
  }
}