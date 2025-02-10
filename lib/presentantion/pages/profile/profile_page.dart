import 'package:flutter/material.dart';
import 'package:speakly/presentantion/assets/theme/app_theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backcolor,
      body: Center(child: Text("Profile page")),
    );
  }
}