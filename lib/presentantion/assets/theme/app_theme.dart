import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'base_colors.dart';
import 'light_mode_colors.dart';


class AppTheme {
  /// App theme colors
  static late BaseColors colors;

  /// Current app theme mode
  static late ThemeMode themeMode;

  /// App theme data
  static late ThemeData data;

  static Future<void> init() async {
    themeMode = ThemeMode.light;
    colors = _getThemeColors();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    final textTheme = TextTheme(
      displayLarge: TextStyle(
        fontSize: 20.sp,
        color: colors.text900,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: TextStyle(
        fontSize: 20.sp,
        color: colors.text900,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        fontSize: 18.sp,
        color: colors.text900,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontSize: 24.sp,
        color: colors.text900,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        fontSize: 15.sp,
        color: colors.text900,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        fontSize: 15.sp,
        color: colors.text900,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 14.sp,
        color: colors.text900,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        color: colors.text900,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontSize: 14.sp,
        color: colors.text900,
        fontWeight: FontWeight.w600,
      ),
      labelSmall: TextStyle(
        fontSize: 12.sp,
        color: colors.text900,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: 10.sp,
        color: colors.text900,
        fontWeight: FontWeight.w500,
      ),
    );


    data = ThemeData( 
      fontFamily: 'Samsung',
      textTheme: textTheme,
      scaffoldBackgroundColor: colors.background,
      brightness: themeMode == ThemeMode.light
        ? Brightness.light
        : Brightness.dark,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colors.primary
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        selectedColor: colors.primary,
        selectedBorderColor: colors.primary,
        fillColor: colors.primary,
      ),
      
      sliderTheme: SliderThemeData(
        activeTrackColor: colors.primary,
        activeTickMarkColor: colors.primary,
        thumbColor: colors.primary,
        inactiveTrackColor: colors.primary.withOpacity(0.25)
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r)
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: colors.background,
        focusColor: colors.primary,
        filled: true,
        errorMaxLines: 3,
        floatingLabelStyle: textTheme.bodyMedium?.copyWith(
          color: colors.primary
        ),
        labelStyle: textTheme.bodyMedium?.copyWith(
          fontSize: 16.sp,
          color: colors.textSecondary
        ),
        counterStyle: textTheme.bodySmall?.copyWith(
          color: colors.primary
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: colors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: colors.stroke),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: colors.red),
        ),
        helperStyle: textTheme.bodyMedium,
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: colors.textSecondary
        ),
        errorStyle: textTheme.bodySmall?.copyWith(
          color: colors.red
        ),
        contentPadding:  EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 16.h,
        )
      )
    );
  }

  static BaseColors _getThemeColors() => const LightModeColors();
}
