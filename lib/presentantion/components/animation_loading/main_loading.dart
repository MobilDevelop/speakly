import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:speakly/presentantion/assets/res/screen_size.dart';
import 'package:speakly/presentantion/assets/theme/app_theme.dart';

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({super.key, this.isBlur});
   final String? isBlur;
  @override
  _LoadingAnimationState createState() => _LoadingAnimationState();
}
  
class _LoadingAnimationState extends State<LoadingAnimation>with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2),)..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.isBlur!=null){
      return Container(
       color: AppTheme.colors.grey.withOpacity(.1),
       child: ClipRect(
         child: BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
   child: Container(
   padding: EdgeInsets.symmetric(vertical: ScreenSize.h20),
    alignment: Alignment.center,
     child:Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
            angle: _controller.value * 2.3 * pi,
            child: Stack(
              alignment: Alignment.center,
              children: List.generate(8, (index) {
                final angle = (index / 8) * 2.5 * pi;
                final radius = 4 + index * 1.1;
                final offset = Offset( 40 * cos(angle), 40 * sin(angle));

                return Transform.translate(
                  offset: offset,
                  child: CircleAvatar(
                    radius: radius,
                    backgroundColor: AppTheme.colors.primary,
                     ),
                   );
                 }),
               ),
              );
             },
            ),
           )
          )
         ),
       ),
     );
    }else{
      return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
            angle: _controller.value * 2 * pi,
            child: Stack(
              alignment: Alignment.center,
              children: List.generate(8, (index) {
                final angle = (index / 8) * 2.3 * pi;
                final radius = 4 + index * 0.7;
                final offset = Offset( 28 * cos(angle), 28 * sin(angle));

                return Transform.translate(
                  offset: offset,
                  child: CircleAvatar(
                    radius: radius,
                    backgroundColor: AppTheme.colors.primary,
                     ),
                   );
                 }),
               ),
              );
             },
            ),
           );
    }
     
  }
}