import 'package:flutter/material.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';

class NewsItems extends StatelessWidget {
  const NewsItems({
    super.key, required this.image, required this.title,
  });
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: ScreenSize.h10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: ScreenSize.h55,
            width: ScreenSize.h55,
            padding: EdgeInsets.all(ScreenSize.h3),
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.colors.primary,width: ScreenSize.h1),
              shape: BoxShape.circle,
              
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(ScreenSize.r25),
              child: Container(
                color: AppTheme.colors.white,
                child: Image.asset(image,fit: BoxFit.cover)),
            ),
          ),
          Text(title,style: AppTheme.data.textTheme.labelSmall)
        ],
      ),
    );
  }
}