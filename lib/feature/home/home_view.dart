import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/feature/home/widgets/home_header.dart';
import 'package:taskati/feature/home/widgets/today_header%20.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //sec 1
            const Home_header(),
            const Gap(10),
            const TodayHeader(),
            const Gap(20),

            //sec date selected
            DatePicker(
              width: 80,
              height: 100,
              // اول يوم انهارده
              DateTime.now(),
              //اول يوم يقف عنده يكون انهارده
              initialSelectedDate: DateTime.now(),
              selectionColor: AppColors.primaruColor,
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                // New date selected
              },
            ),

            //sec tasks
            const Gap(15),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.all(5),
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
                                  Gap(5),
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
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
