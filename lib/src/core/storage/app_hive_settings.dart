import 'package:flutter_application_2/src/core/constatns/app_const.dart';
import 'package:hive/hive.dart';

initHiveSettings() async {
  await Hive.openBox(AppConstants.token);
  await Hive.openBox(AppConstants.refresh);
  await Hive.openBox(AppConstants.timeSaved);
}

class AppHiveSettings {
  static dynamic getStringValue({required String key}) {
    Box box = Hive.box(key);
    return box.get(key);
  }

  static void saveValue({required String key, required String value}) {
    Box box = Hive.box(key);
    box.put(key, value);
  }

  static dynamic localClear({required String key}) async {
    Box box = Hive.box(key);
    await box.clear();
  }
}
