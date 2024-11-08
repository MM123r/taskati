import 'package:hive/hive.dart';
import 'package:taskati/core/model/task_model.dart';

class AppLocalStorage {
  static late Box userbox;
  static late Box<TaskModel> taskbox;
  static String nameKey = 'name';
  static String imageKey = 'image';
  static String isUploadKey='isUpload';
  

  static init() {
    userbox = Hive.box('user');
    taskbox = Hive.box<TaskModel>('task');
  }

  static cachData(String key, dynamic value) {
    userbox.put(key, value);
  }

  static getcachData(String key) {
    return userbox.get(key);
  }

 

  static cachTaskData(String key, TaskModel  value) {
    taskbox.put(key, value);
  }

  static TaskModel? getcachTaskData(String key) {
    return taskbox.get(key);
  }
}






/*
                    //cache the data
                    var box = Hive.box('user');
                    box.put('name', name);
                    log(box.get('name').toString());
                    //HomeView
                    pushWithReplacment(context, HomeView());
*/