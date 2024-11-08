import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

// ignore: camel_case_types
class task_item extends StatelessWidget {
  const task_item({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.primaruColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Flutter Task 1",
                  style: getTitleTextStyle(
                      color: AppColors.whiteColor, fontsize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Gap(5),
                Row(
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      color: AppColors.whiteColor,
                      size: 20,
                    ),
                  const Gap(5),
                    Text(
                      "10:00 AM  11:00 AM",
                      style: getSmallTextStyle(
                          color: AppColors.whiteColor,
                          fontsize: 12),
                    ),
                  ],
                ),
                const Gap(5),
                Text(
                  "I will do This Task",
                  style: getSmallTextStyle(
                      color: AppColors.whiteColor, fontsize: 12),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 60,
            color: AppColors.whiteColor,
            child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  "TODO",
                  style: getBodyTextStyle(
                      color: AppColors.whiteColor,
                      fontweight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }
}
