import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';

class FreeExam extends StatelessWidget {
  const FreeExam({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ScreenSize.r10),
      ),
      child:SvgPicture.asset(AppIcons.exam)
    );
  }
}