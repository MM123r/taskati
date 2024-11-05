import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.width = 250,
    this.height = 45,
    required this.text,
    this.bgcolor,
    this.textColor,
    required this.onPressed,
  });
  
  final double width;
  final double height;
  final Color? bgcolor;
  final Color? textColor;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgcolor ?? AppColors.primaruColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: getBodyTextStyle(
            color: textColor ?? AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}



