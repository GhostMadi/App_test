import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/core/dependencies/injection_container.dart';
import 'package:flutter_application_2/src/core/storage/app_hive_settings.dart';
import 'package:flutter_application_2/src/feature/app/widgets/app_configuration.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await initGetIt();
  await Hive.initFlutter();
  await initHiveSettings();

  // await initDependencies();
  runApp(const App());
}
