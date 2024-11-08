import 'package:flutter/material.dart';
//import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/services/app_local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/feature/intro/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('user');
  await Hive.openBox('task');
  await AppLocalStorage.init();
  Hive.registerAdapter(TaskModelAdapter());
  //
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: AppColors.primaruColor,
            titleTextStyle: getBodyTextStyle(
              color: AppColors.whiteColor,
            ),
            foregroundColor: AppColors.whiteColor,
          ),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: getSmallTextStyle(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaruColor),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaruColor),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaruColor),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaruColor),
              borderRadius: BorderRadius.circular(10),
            ),
          )),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
