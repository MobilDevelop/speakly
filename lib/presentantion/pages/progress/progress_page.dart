import 'package:flutter/material.dart';
import 'package:speakly/presentantion/assets/theme/app_theme.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backcolor,
      appBar: AppBar(
          title: Text(" Progress & Feedback",style: AppTheme.data.textTheme.headlineMedium),
          backgroundColor: AppTheme.colors.white,
          centerTitle: true,
          elevation: 0,
        ),
      body: Center(child: Text("Progress page")),
    );
  }
}