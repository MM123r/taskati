import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/services/app_local_storage.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/feature/home/home_view.dart';
import 'package:taskati/feature/upload/upload_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    bool isUploaded  = AppLocalStorage.getcachData(AppLocalStorage.isUploadKey) ?? false;
    Future.delayed(const Duration(seconds: 6), () {
      if (isUploaded) {
        // ignore: use_build_context_synchronously
        pushWithReplacment(context, const HomeView());
      } else {
        // ignore: use_build_context_synchronously
        pushWithReplacment(context, const UploadScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/logo.json'),
            Text(
              "Taskati",
              style: getTitleTextStyle(context,),
            ),
            const Gap(10),
            Text(
              "Its time to get organized",
              style: getSmallTextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
