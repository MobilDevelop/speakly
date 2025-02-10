import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';

import 'components/button_view.dart';

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: AppTheme.colors.backcolor,
      body: Scaffold(
        appBar: AppBar(
          title: Text(" Study Resources",style: AppTheme.data.textTheme.headlineMedium),
          backgroundColor: AppTheme.colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: ScreenSize.h10,vertical: ScreenSize.h10),
          color: AppTheme.colors.backcolor,
          child: Column(
            children: [
              ButtonView(
                image1: AppIcons.image1,
                image2: AppIcons.image3,
              ),
              
              Gap(ScreenSize.h15),
              ButtonView(
                image1: AppIcons.image4,
                image2: AppIcons.image5,
              ),
              Gap(ScreenSize.h15),
              ButtonView(
                image1: AppIcons.image2,
                image2: AppIcons.image3,
              )
            ],
          ),
        ),
      ),
    );
  }
}