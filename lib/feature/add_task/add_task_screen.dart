import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/services/app_local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/feature/home/home_view.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var formKey = GlobalKey<FormState>();
  var titleControla = TextEditingController();
  var noteControla = TextEditingController();
  var dateControla = TextEditingController(
      text: DateFormat('dd/MM/yyyy').format(DateTime.now()));
  var startTimeControla =
      TextEditingController(text: DateFormat('hh:mm a').format(DateTime.now()));
  var endTimeControla =
      TextEditingController(text: DateFormat('hh:mm a').format(DateTime.now()));
  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //sec AppBar
      appBar: AppBar(
        title: const Text("Add Task"),
      ),

      //sec Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Title"),
                const Gap(5),
                TextFormField(
                  controller: titleControla,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter some text';
                    }
                    return null;
                  },
                ),
                const Gap(5),
                const Text("Note"),
                const Gap(5),
                TextFormField(
                  maxLines: 2,
                  controller: noteControla,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter some text';
                    }
                    return null;
                  },
                ),
                const Gap(5),
                const Text("Date"),
                const Gap(5),
                TextFormField(
                  readOnly: true,
                  controller: dateControla,
                  onTap: () {
                    showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            initialDate: DateTime.now(),
                            lastDate: DateTime(2050))
                        .then((value) {
                      if (value != null) {
                        dateControla.text =
                            DateFormat('dd/MM/yyyy').format(value);
                      }
                    });
                  },
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                    Icons.calendar_month,
                    color: AppColors.primaruColor,
                  )),
                ),
                const Gap(5),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Start Time"),
                        TextFormField(
                          readOnly: true,
                          controller: startTimeControla,
                          onTap: () {
                            showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                .then((value) {
                              if (value != null) {
                                // ignore: use_build_context_synchronously
                                startTimeControla.text = value.format(context);
                              }
                            });
                          },
                          decoration: InputDecoration(
                              suffixIcon: Icon(
                            Icons.watch_later_outlined,
                            color: AppColors.primaruColor,
                          )),
                        )
                      ],
                    )),
        
                    const Gap(10),
                    //sec2
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("End Time"),
                        TextFormField(
                          readOnly: true,
                          controller: endTimeControla,
                          onTap: () {
                            showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                .then((value) {
                              if (value != null) {
                                // ignore: use_build_context_synchronously
                                endTimeControla.text = value.format(context);
                              }
                            });
                          },
                          decoration: InputDecoration(
                              suffixIcon: Icon(
                            Icons.watch_later_outlined,
                            color: AppColors.primaruColor,
                          )),
                        )
                      ],
                    ))
                  ],
                ),
                const Gap(10),
                Row(
                  children: [
                    //sec 1
                    Row(
                      children: List.generate(
                        3,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedColor = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: CircleAvatar(
                                backgroundColor: index == 0
                                    ? AppColors.primaruColor
                                    : index == 1
                                        ? AppColors.orangColor
                                        : AppColors.redColor,
                                child: (selectedColor == index)
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      )
                                    : const SizedBox(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                    CustomButton(
                      width: 130,
                      
                      text: 'Create Task',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          String id =
                              DateTime.now().toString() + titleControla.text;
                          AppLocalStorage.cachTaskData(
                            id,
                            TaskModel(
                                id: id,
                                title: titleControla.text,
                                note: noteControla.text,
                                date: dateControla.text,
                                startTime: startTimeControla.text,
                                endTime: endTimeControla.text,
                                color: selectedColor,
                                isCompelet: false),
                          );
                          log(AppLocalStorage.getcachTaskData(id)?.title ?? '');
                          pushWithReplacment(context, const HomeView());
                        }
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
