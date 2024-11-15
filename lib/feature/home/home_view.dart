import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/services/app_local_storage.dart';
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
  String selectDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              dayTextStyle: getBodyTextStyle(context),
              dateTextStyle: getBodyTextStyle(context),
              monthTextStyle: getBodyTextStyle(context),
              onDateChange: (date) {
                // New date selected
                setState(() {
                  selectDate = DateFormat('dd/MM/yyyy').format(date);
                });
              },
            ),

            //sec tasks
            const Gap(15),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: AppLocalStorage.taskbox.listenable(),
                builder: (context, box, child) {
                  List<TaskModel> tasks = [];

                  for (var element in box.values) {
                    if (element.date == selectDate) {
                      tasks.add(element);
                    }
                  }

                  if (tasks.isEmpty) {
                    return Column(
                      children: [
                        Lottie.asset('assets/images/empty.json'),
                        Text(
                          "No Tasks for $selectDate",
                          style: getBodyTextStyle(context,fontsize: 16),
                        )
                      ],
                    );
                  }

                  return ListView.builder(
                    itemCount: tasks.length,
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
                                  style: getBodyTextStyle(context,
                                      color: AppColors.whiteColor),
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
                                  style: getBodyTextStyle(context,
                                      color: AppColors.whiteColor),
                                ),
                              ],
                            ),
                          ),
                          onDismissed: (direction) {
                            if (direction == DismissDirection.startToEnd) {
                              //log("Complete");
                              box.put(
                                  tasks[index].id,
                                  TaskModel(
                                      id: tasks[index].id,
                                      title: tasks[index].title,
                                      note: tasks[index].note,
                                      date: tasks[index].date,
                                      startTime: tasks[index].startTime,
                                      endTime: tasks[index].endTime,
                                      color: 3,
                                      isCompelet: true));
                            } else {
                              // log("Delete");
                              box.delete(tasks[index].id);
                            }
                          },
                          child: task_item(
                            taskModel: tasks[index],
                          ));
                    },
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
