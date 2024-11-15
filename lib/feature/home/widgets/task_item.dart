import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

// ignore: camel_case_types
class task_item extends StatelessWidget {
  const task_item({
    super.key, required this.taskModel,
  });
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: taskModel.color==3
        ? AppColors.greyColor :
         taskModel.color==0 
        ? AppColors.primaruColor 
        : taskModel .color==1 
        ? AppColors.orangColor
        : AppColors.redColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskModel.title?? '',
                  style: getTitleTextStyle(context,
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
                      '${taskModel.startTime} : ${taskModel.endTime}',
                      style: getSmallTextStyle(
                          color: AppColors.whiteColor, fontsize: 12),
                    ),
                  ],
                ),
                const Gap(5),
                Text(
                  taskModel.note?? '',
                  style: getSmallTextStyle(
                      color: AppColors.whiteColor, fontsize: 12),
                ),
              ],
            ),
          ),
          const Gap(10),
          Container(
            width: 1,
            height: 60,
            color: AppColors.whiteColor,
          ),
          const Gap(10),
          RotatedBox(
            quarterTurns: 3,
            child: Text((taskModel.isCompelet?? false )? "Completed":'TODO',
            style: getSmallTextStyle(
              color: AppColors.whiteColor,fontweight: FontWeight.bold
            ),
            ),
            
            ),
        ],
      ),
    );
  }
}
