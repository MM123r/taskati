
import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';

showErrorDialog(BuildContext context, String massege){
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: AppColors.redColor,
   content: Text(massege)));
}