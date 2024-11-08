

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/feature/home/widgets/home_header.dart';
import 'package:taskati/feature/home/widgets/task_item.dart';
import 'package:taskati/feature/home/widgets/today_header%20.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

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
                  return Dismissible(
                      key: UniqueKey(),
                      secondaryBackground: Container(
                        margin: const EdgeInsets.only(bottom: 8, top: 8),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.redColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.delete,
                              color: AppColors.whiteColor,
                            ),
                            const Gap(10),
                            Text(
                              "Delete",
                              style:
                                  getBodyTextStyle(color: AppColors.whiteColor),
                            ),
                          ],
                        ),
                      ),
                      background: Container(
                        margin: const EdgeInsets.only(bottom: 8, top: 8),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.check,
                              color: AppColors.whiteColor,
                            ),
                            const Gap(10),
                            Text(
                              "Complete",
                              style:
                                  getBodyTextStyle(color: AppColors.whiteColor),
                            ),
                          ],
                        ),
                      ),
                      onDismissed: (direction) {
                        if (direction == DismissDirection.startToEnd) {
                          //log("Complete");
                        } else {
                         // log("Delete");
                        }
                      },
                      child: const task_item());
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
