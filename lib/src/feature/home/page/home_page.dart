import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/core/constatns/app_const.dart';
import 'package:flutter_application_2/src/core/storage/app_hive_settings.dart';
import 'package:flutter_application_2/src/feature/app/router/app_router.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: TextButton(onPressed: (){
        AppHiveSettings.localClear(key: AppConstants.token);
        context.router.replace(const SplashRouteRoute());}, child: const Text('xlear')),
    );
  }
}
