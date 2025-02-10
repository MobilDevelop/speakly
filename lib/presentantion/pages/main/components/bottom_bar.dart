import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speakly/domain/common/constants.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key, required this.index, required this.ontap,
  });
  final int index;
  final Function ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.h60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.colors.white,
        border: Border(top: BorderSide(color: AppTheme.colors.grey1)),
        borderRadius: BorderRadius.vertical(top: Radius.circular(ScreenSize.r15))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Bounce(
            duration: Duration(milliseconds: AppContatants.duration),
            onTap: () => ontap(0),
            child: SizedBox(
              height: ScreenSize.h60,
              width: ScreenSize.h70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.home,height: ScreenSize.h30,color: index==0? AppTheme.colors.primary:AppTheme.colors.grey1),
                  Text("Home",style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: index==0? AppTheme.colors.primary:AppTheme.colors.grey1))
                ],
              ),
            ),
          ),

          Bounce(
            duration: Duration(milliseconds: AppContatants.duration),
            onTap: () => ontap(1),
            child: SizedBox(
              height: ScreenSize.h60,
              width: ScreenSize.h70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.resources,height: ScreenSize.h30,color: index==1? AppTheme.colors.primary:AppTheme.colors.grey1),
                  Text("Resources",style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: index==1? AppTheme.colors.primary:AppTheme.colors.grey1))
                ],
              ),
            ),
          ),

          Bounce(
            duration: Duration(milliseconds: AppContatants.duration),
            onTap: () => ontap(2),
            child: SizedBox(
              height: ScreenSize.h60,
              width: ScreenSize.h70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.progress,height: ScreenSize.h30,color: index==2? AppTheme.colors.primary:AppTheme.colors.grey1),
                  Text("Progress",style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: index==2? AppTheme.colors.primary:AppTheme.colors.grey1))
                ],
              ),
            ),
          ),

          Bounce(
            duration: Duration(milliseconds: AppContatants.duration),
            onTap: () => ontap(3),
            child: SizedBox(
              height: ScreenSize.h60,
              width: ScreenSize.h70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.account,height: ScreenSize.h30,color: index==3? AppTheme.colors.primary:AppTheme.colors.grey1),
                  Text("Profile",style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: index==3? AppTheme.colors.primary:AppTheme.colors.grey1))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}