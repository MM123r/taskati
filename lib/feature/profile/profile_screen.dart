import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/services/app_local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/widgets/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? path;
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //sec AppBar
        appBar: AppBar(),

        //sec Body
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: AppColors.whiteColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomButton(
                                width: double.infinity,
                                onPressed: () async {
                                  await uploadImage(isCamera: true);
                                },
                                text: "Upload From Camera",
                              ),
                              const Gap(10),
                              CustomButton(
                                width: double.infinity,
                                onPressed: () async {
                                  await uploadImage(isCamera: false);
                                },
                                text: "Upload From Gallery",
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                          radius: 70,
                          backgroundColor: AppColors.primaruColor,
                          backgroundImage: FileImage(File(
                              AppLocalStorage.getcachData(
                                  AppLocalStorage.imageKey)))),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.whiteColor,
                              ),
                              child: const Icon(Icons.camera_alt_outlined)))
                    ],
                  ),
                ),
                const Gap(30),
                const Gap(30),
                Divider(
                  color: AppColors.primaruColor,
                  indent: 20,
                  endIndent: 20,
                ),
                const Gap(30),
              ],
            ),
          ),
        ));
  }

  uploadImage({required bool isCamera}) async {
    await ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery)
        .then((value) {
      if (value != null) {
        AppLocalStorage.cachData(AppLocalStorage.imageKey, value.path);
        setState(() {
          Navigator.of(context).pop();
        });
      }
    });
  }
}
