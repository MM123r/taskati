import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/functions/dialogs.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/services/app_local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/feature/home/home_view.dart';

class UploadScreen extends StatefulWidget {
  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String? path;
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //sec AppBar
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  if (path == null && name.isEmpty) {
                    showErrorDialog(
                        context, 'Please Uplaod an Image and Enter your Nmae');
                  }
                  //
                  else if (path != null && name.isEmpty) {
                    showErrorDialog(context, 'Please Enter your Nmae');
                  }
                  //
                  else if (path == null && name.isNotEmpty) {
                    showErrorDialog(context, 'Please Uplaod an Image');
                  }
                  //
                  else {
                    //cache the data
                    AppLocalStorage.cachData(AppLocalStorage.nameKey,name);
                    AppLocalStorage.cachData(AppLocalStorage.imageKey,path);
                    AppLocalStorage.cachData(AppLocalStorage.isUploadKey,true);
                    //HomeView
                    pushWithReplacment(context, HomeView());
                  }
                },
                child: Text(
                  "Done",
                  style: getSmallTextStyle(color: AppColors.primaruColor),
                ))
          ],
        ),

        //sec Body
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: path != null
                      ? AssetImage(path!)
                      : const AssetImage('assets/images/user2.jpeg'),
                ),
                const Gap(30),
                CustomButton(
                  onPressed: () async {
                    await uploadImage(
                      isCamera: true,
                    );
                  },
                  text: 'Upload From Image',
                ),
                const Gap(10),
                CustomButton(
                  onPressed: () async {
                    await uploadImage(
                      isCamera: false,
                    );
                  },
                  text: 'Upload From Gallery',
                ),
                const Gap(30),
                Divider(
                  color: AppColors.primaruColor,
                  indent: 20,
                  endIndent: 20,
                ),
                const Gap(30),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    
                  ),
                )
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
        setState(() {
          path = value.path;
        });
      }
    });
  }
}
