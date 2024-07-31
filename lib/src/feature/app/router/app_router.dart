import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/feature/auth/pages/app_transfer.dart';
import 'package:flutter_application_2/src/feature/auth/pages/auth_page.dart';
import 'package:flutter_application_2/src/feature/home/page/home_route.dart';
import 'package:flutter_application_2/src/feature/home/page/map_page/page/map.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/model/done_work/done_work.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/model/field.dart';
import 'package:flutter_application_2/src/feature/notice/page/notice_page.dart';
import 'package:flutter_application_2/src/feature/reports/page/reports_page.dart';
import 'package:flutter_application_2/src/feature/task/page/all/pages/all_page.dart';
import 'package:flutter_application_2/src/feature/task/page/my_tasks/pages/all_tasks_page.dart';
import 'package:flutter_application_2/src/feature/task/page/task_page.dart';

import '../../app_indexed.dart';
import '../../home/page/home_page.dart';
import '../../incident/page/incident_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRouteRoute.page, initial: true),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: AppIndexedRoute.page, children: [
          HomeRouteSelecter.routes,
          AutoRoute(page: IncidentRoute.page),
          AutoRoute(page: NoticeRoute.page),
          AutoRoute(page: ReportsRoute.page),
          AutoRoute(page: TaskRoute.page, children: [
            AutoRoute(page: AllRoute.page, fullscreenDialog: false),
            AutoRoute(page: AllTaskRoute.page, fullscreenDialog: false)
          ]),
        ]),
      ];
}

//HomePageAutoRoute
abstract class HomeRouteSelecter {
  static final routes = AutoRoute(page: HomeRouterRoute.page, children: [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: MapRoute.page)
  ]);
}
