import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/services/app_local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/feature/profile/profile_screen.dart';

// ignore: camel_case_types
class Home_header extends StatelessWidget {
  const Home_header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, ${AppLocalStorage.getcachData(AppLocalStorage.nameKey)}",
              style: getTitleTextStyle(
                  color: AppColors.primaruColor, fontweight: FontWeight.normal),
            ),
            Text(
              "Have a Nice Day!",
              style: getSmallTextStyle(),
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            pushTo(context, const ProfileScreen());
          },
          child: CircleAvatar(
            radius: 27, //assets chach
            backgroundImage:FileImage(File(AppLocalStorage.getcachData(AppLocalStorage.imageKey)))
               
          ),
        )
      ],
    );
  }
}
