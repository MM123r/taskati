import 'package:flutter/material.dart';
import 'package:taskati/core/constants/app_fonts.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

class AppTheme {
  static final LightTheme=ThemeData(
              scaffoldBackgroundColor: AppColors.whiteColor,
              colorScheme: ColorScheme.fromSeed(
                  seedColor: AppColors.primaruColor,
                  onSurface: AppColors.darkblueColor),
              appBarTheme: AppBarTheme(
                color: AppColors.primaruColor,
                centerTitle: true,
                titleTextStyle:TextStyle(
                  fontFamily: AppFonts.poppins,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                color: AppColors.darkblueColor,),
                
                foregroundColor: AppColors.whiteColor,
              ),
              datePickerTheme: DatePickerThemeData(
                backgroundColor: AppColors.darkblueColor,
                headerForegroundColor: AppColors.primaruColor
              ),
              timePickerTheme: TimePickerThemeData(
                backgroundColor: AppColors.whiteColor,
                //hourMinuteColor: AppColors.
               dialBackgroundColor: AppColors.whiteColor
              ),
              inputDecorationTheme: InputDecorationTheme(
                hintStyle: getSmallTextStyle(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaruColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaruColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaruColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaruColor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ));


  static final DarkTheme=ThemeData(
            scaffoldBackgroundColor: AppColors.darkblueColor,
            colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primaruColor,
                onSurface: AppColors.whiteColor),
            appBarTheme: AppBarTheme(
              color: AppColors.primaruColor,
              centerTitle: true,
              titleTextStyle: TextStyle(
                  fontFamily: AppFonts.poppins,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,),
              foregroundColor: AppColors.whiteColor,
            ),
              datePickerTheme: DatePickerThemeData(
                backgroundColor: AppColors.darkblueColor,
                headerForegroundColor: AppColors.primaruColor,
              ),
              timePickerTheme: TimePickerThemeData(
                backgroundColor: AppColors.darkblueColor,
                //hourMinuteColor: AppColors.
               dialBackgroundColor: AppColors.darkblueColor
              ),
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: getSmallTextStyle(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaruColor),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaruColor),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaruColor),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaruColor),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
}