import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:speakly/domain/common/constants.dart';
import 'package:speakly/presentantion/assets/res/app_icons.dart';
import 'package:speakly/presentantion/assets/res/screen_size.dart';
import 'package:speakly/presentantion/assets/theme/app_theme.dart';

import 'components/button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backcolor,
      appBar: AppBar(
          title: Text("  Settings",style: AppTheme.data.textTheme.headlineMedium),
          backgroundColor: AppTheme.colors.white,
          centerTitle: true,
          elevation: 0,
        ),
      body: ListView(
        padding: EdgeInsets.only(top: ScreenSize.h10),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenSize.h12),
            child: Row(
              children: [
                Container(
                  height: ScreenSize.h70,
                  width: ScreenSize.h70,
                  decoration: BoxDecoration(
                    color: AppTheme.colors.white,
                    border: Border.all(color: AppTheme.colors.primary),
                    borderRadius: BorderRadius.circular(ScreenSize.r8)
                  ),
                ),
                Gap(ScreenSize.h10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello Muhammadayubxon",style: AppTheme.data.textTheme.titleMedium),
                    Gap(ScreenSize.h4),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: ScreenSize.h8,vertical: ScreenSize.h4),
                      decoration: BoxDecoration(
                        color: AppTheme.colors.information.withOpacity(.2),
                        borderRadius: BorderRadius.circular(ScreenSize.r7)
                      ),
                      child: Text("Edite profile",style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.information)),
                    )
                  ],
                )
              ],
            ),
          ),
          
          Gap(ScreenSize.h10),
          Bounce(
            duration: Duration(milliseconds: AppContatants.duration),
            onTap: (){},
            child: SvgPicture.asset(AppIcons.prfile,fit: BoxFit.fill)),
          
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenSize.h12),
            child: Column(
              children: [
                ProfileButton(
              title: "Notifications",
              press: (){},
            ),
          
            ProfileButton(
              title: "Languages",
              press: (){},
            ),
          
            ProfileButton(
              title: "Security Settings",
              press: (){},
            ),
          
            Gap(ScreenSize.h25),
            ProfileButton(
              title: "Support",
              press: (){},
            ),
          
            ProfileButton(
              title: "Privacy Policy",
              press: (){},
            ),
          
            ProfileButton(
              title: "Invite a friend",
              textcolor: AppTheme.colors.information,
              press: (){},
            )
              ],
            ),
          )
        ],
      ),
    );
  }
}