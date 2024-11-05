import 'package:hive/hive.dart';

class AppLocalStorage {
  static late Box userbox;
  static String nameKey = 'name';
  static String imageKey = 'image';
  static String isUploadKey='isUpload';
  

  static init() {
    userbox = Hive.box('user');
  }

  static cachData(String key, dynamic value) {
    userbox.put(key, value);
  }

  static getcachData(String key) {
    return userbox.get(key);
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