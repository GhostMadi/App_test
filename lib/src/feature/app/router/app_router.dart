import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/feature/auth/pages/app_transfer.dart';
import 'package:flutter_application_2/src/feature/auth/pages/auth_page.dart';
import 'package:flutter_application_2/src/feature/home/page/map.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/model/done_work/done_work.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/model/field.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/maps_logic/model/map.dart';
import 'package:flutter_application_2/src/feature/notice/page/notice_page.dart';
import 'package:flutter_application_2/src/feature/reports/page/reports_page.dart';
import 'package:flutter_application_2/src/feature/task/page/all_task/pages/all_tasks_page.dart';
import 'package:flutter_application_2/src/feature/task/page/my_task/pages/my_task.dart';
import 'package:flutter_application_2/src/feature/task/page/task_page.dart';

import '../../app_indexed.dart';
import '../../incident/page/incident_page.dart';
part 'app_router.gr.dart';


@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRouteRoute.page, initial: true),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: AppIndexedRoute.page, children: [
          AutoRoute(page: MapRoute.page),
          AutoRoute(page: IncidentRoute.page),
          AutoRoute(page: NoticeRoute.page),
          AutoRoute(page: ReportsRoute.page),
          AutoRoute(page: TaskRoute.page, children: [
            AutoRoute(page: MyTaskRoute.page),
            AutoRoute(page: AllTaskRoute.page)
          ]),
        ]),
      ];
}

//HomePageAutoRoute

