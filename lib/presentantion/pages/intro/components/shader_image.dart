import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';

class ShaderImage extends StatelessWidget {
  const ShaderImage({
    super.key, required this.image, required this.title, required this.desc,
  });
  final String image;
  final String title;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ShaderMask(
         shaderCallback: (rect) {
          return const LinearGradient(
           begin: Alignment.topCenter,
           end: Alignment.bottomCenter,
           colors: [Colors.black, Colors.transparent]).createShader(Rect.fromLTRB(0, 350, rect.width, rect.height * 0.72));},
          blendMode: BlendMode.dstIn,
          child: Container(
            alignment: Alignment.center,
            child: Image.asset(image),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("The best AI Examine \napp in this century",
            style: AppTheme.data.textTheme.displayLarge!.copyWith(fontSize: ScreenSize.sp25),
            textAlign: TextAlign.center),
        
           Gap(ScreenSize.h10),
           Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor...",
            style: AppTheme.data.textTheme.bodyLarge,
            textAlign: TextAlign.center,
           ),
           Gap(ScreenSize.h20)
          ],
        )
      ],
    );
  }
}