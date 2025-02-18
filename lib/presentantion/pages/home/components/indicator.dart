import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speakly/presentantion/assets/res/screen_size.dart';
import 'package:speakly/presentantion/assets/theme/app_theme.dart';

class ArcIndicator extends StatelessWidget {
  final double value;
  final Color? color;

  const ArcIndicator({super.key, required this.value, this.color = Colors.white});

  String getIndicatorText() {
    if (value <= 3.0) {
      return 'Low';
    } else if (value <= 6.0) {
      return 'Medium';
    } else {
      return 'Perfect';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRect(
          child: Align(
            alignment: Alignment.topCenter,
            heightFactor: 0.6,
            child: Padding(
              padding: EdgeInsets.only(top: ScreenSize.h8),
              child: CustomPaint(
                size: Size(185.h, 185.h),
                painter: IndicatorPainter(value),
              ),
            ),
          ),
        ),
        Positioned.fill(
          top: ScreenSize.h25,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value.toString(),
                style: AppTheme.data.textTheme.headlineSmall
              ),
              Text(
                getIndicatorText(),
                style: AppTheme.data.textTheme.headlineMedium
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class IndicatorPainter extends CustomPainter {
  final double value;

  IndicatorPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = ScreenSize.h4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const double startAngle = -pi;
    const double sweepAngle = pi;

    const double segmentAngle = sweepAngle / 9;

    Paint circlePaint = Paint()..color = colors[value.floor()];

    for (int i = 0; i < 9; i++) {
      paint.color = colors[i];
      canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: size.width / 2),
        startAngle + i * segmentAngle,
        segmentAngle - 0.07,
        false,
        paint,
      );
    }

    final double circleX = size.width / 2 +(size.width / 2) * cos(startAngle + value * segmentAngle - segmentAngle / 6);
    final double circleY = size.height / 2 + (size.height / 2) * sin(startAngle + value * segmentAngle - segmentAngle / 6);

    canvas.drawCircle(Offset(circleX, circleY), 12, circlePaint);
  }

  List<Color> colors = [
    const Color(0xffF96258),
    const Color(0xffF96258),
    const Color(0xffF96258),
    const Color(0xffF96258),
    const Color(0xffFF8537),
    const Color(0xffFFD522),
    const Color(0xffFFD522),
    const Color(0xff3EDD93),
    const Color(0xff3EDD93),
  ];

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
