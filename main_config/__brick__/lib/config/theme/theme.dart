import 'package:flutter/material.dart';
import 'package:hamrah_amozeshgah/config/theme/app_colors.dart';

class ThemeConfig {
  ThemeData lightTheme() {
    return ThemeData(
        primaryColor: AppColors.primaryL,
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
        fontFamily: 'IRANYekanX',
        textTheme: const TextTheme(
          displayLarge: TextStyle(height: 1.5, color: Colors.black),
          displayMedium: TextStyle(height: 1.5, color: Colors.black),
          displaySmall: TextStyle(height: 1.5, color: Colors.black),
          headlineLarge: TextStyle(height: 1.5, color: Colors.black),
          headlineMedium: TextStyle(height: 1.5, color: Colors.black),
          headlineSmall: TextStyle(height: 1.5, color: Colors.black),
          titleLarge: TextStyle(height: 1.5, color: Colors.black),
          titleMedium: TextStyle(height: 1.5, color: Colors.black),
          titleSmall: TextStyle(height: 1.5, color: Colors.black),
          bodyLarge: TextStyle(height: 1.5, color: Colors.black),
          bodyMedium: TextStyle(height: 1.5, color: Colors.black),
          bodySmall: TextStyle(height: 1.5, color: Colors.black),
          labelLarge: TextStyle(height: 1.5, color: Colors.black),
          labelMedium: TextStyle(height: 1.5, color: Colors.black),
          labelSmall: TextStyle(height: 1.5, color: Colors.black),
        ).apply(
          fontFamily: 'IRANYekanX',
        ),
        inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.transparent,
            contentPadding: const EdgeInsets.all(20),
            hintStyle: const TextStyle(
              color: AppColors.secondTextL,
              fontFamily: 'IRANYekanX',
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xffE4E7F0))),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: AppColors.primaryL, width: 1.5)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xffE4E7F0)))),

        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            // Solid color
            foregroundColor: Colors.white,
            elevation: 0,
            scrolledUnderElevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle:
                TextStyle(fontFamily: 'IRANYekanX', fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500)),
        scaffoldBackgroundColor: Colors.white);
  }

  ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryD, // فرض بر اینه که تعریفش کردی مثل primaryL
      bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
      fontFamily: 'IRANYekanX',
      scaffoldBackgroundColor: AppColors.backGroundD,
      textTheme: const TextTheme(
        displayLarge: TextStyle(height: 1.5, color: Colors.white),
        displayMedium: TextStyle(height: 1.5, color: Colors.white),
        displaySmall: TextStyle(height: 1.5, color: Colors.white),
        headlineLarge: TextStyle(height: 1.5, color: Colors.white),
        headlineMedium: TextStyle(height: 1.5, color: Colors.white),
        headlineSmall: TextStyle(height: 1.5, color: Colors.white),
        titleLarge: TextStyle(height: 1.5, color: Colors.white),
        titleMedium: TextStyle(height: 1.5, color: Colors.white),
        titleSmall: TextStyle(height: 1.5, color: Colors.white),
        bodyLarge: TextStyle(height: 1.5, color: Colors.white),
        bodyMedium: TextStyle(height: 1.5, color: Colors.white),
        bodySmall: TextStyle(height: 1.5, color: Colors.white),
        labelLarge: TextStyle(height: 1.5, color: Colors.white),
        labelMedium: TextStyle(height: 1.5, color: Colors.white),
        labelSmall: TextStyle(height: 1.5, color: Colors.white),
      ).apply(fontFamily: 'IRANYekanX'),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
        contentPadding: const EdgeInsets.all(20),
        hintStyle: const TextStyle(
          color: AppColors.secondTextD,
          fontFamily: 'IRANYekanX',
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xff444444)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primaryD, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xff444444)),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1E1E1E),
        foregroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          fontFamily: 'IRANYekanX',
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

}
