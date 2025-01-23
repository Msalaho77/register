import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTheme {
  static const TextStyle appBarTextStyle = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.normal,
    fontSize: 18,
  );
  static const TextStyle titleTextStyle = TextStyle(
      color: AppColors.black, fontWeight: FontWeight.bold, fontSize: 24);
  static const TextStyle regularTitleTextStyle = TextStyle(
      color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 16);

  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: AppColors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
            centerTitle: true,
            elevation: 0,
            titleTextStyle: appBarTextStyle,
            iconTheme: IconThemeData(
              color: AppColors.gray,
            )
        ),
        scaffoldBackgroundColor: AppColors.light,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: AppColors.black,
          ),
        ),
        colorScheme: const ColorScheme.light(primary: AppColors.primary),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                foregroundColor: AppColors.black
            )
        ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          side: WidgetStateProperty.all<BorderSide>(const BorderSide(color: AppColors.primary
          )),
          elevation:WidgetStateProperty.all<double>(0),
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
              return AppColors.primary;
            },
          ),
        ),
      ),
    );
  }
}