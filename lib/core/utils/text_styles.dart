import 'package:flutter/material.dart';
import 'package:taskati/core/constants/app_fonts.dart';
import 'package:taskati/core/utils/colors.dart';

TextStyle getTitleTextStyle({double? fontsize, Color? color,FontWeight? fontweight}) {
  return  TextStyle(
    fontFamily: AppFonts.poppins ,
    fontSize: fontsize ?? 18,
    fontWeight: fontweight ?? FontWeight.bold,
    color:color?? Colors.black
  );
}



TextStyle getBodyTextStyle({double? fontsize, Color? color,FontWeight? fontweight}) {
  return  TextStyle(
    fontFamily: AppFonts.poppins ,
    fontSize: fontsize ?? 16,
    fontWeight: fontweight ?? FontWeight.normal,
    color:color??  AppColors.darkblueColor
  );
}

TextStyle getSmallTextStyle({double? fontsize, Color? color,FontWeight? fontweight}) {
  return  TextStyle(
    fontFamily: AppFonts.poppins ,
    fontSize: fontsize ?? 14,
    fontWeight: fontweight ?? FontWeight.normal,
    color:color?? AppColors.greyColor
  );
}
