import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';

class SelectNumberView extends StatelessWidget {
  const SelectNumberView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.h10),
      child: Column(
        children: [
          Gap(ScreenSize.h8),
            Container(
             height: ScreenSize.h3,
             width: ScreenSize.h50,
              decoration: BoxDecoration(
               color: AppTheme.colors.grey1,
                 borderRadius: BorderRadius.circular(ScreenSize.r5)
            ),
          ),
        ],
      ),
    );
  }
}