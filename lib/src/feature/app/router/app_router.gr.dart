// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AllRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AllPage(),
      );
    },
    AllTaskRoute.name: (routeData) {
      final args = routeData.argsAs<AllTaskRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AllTaskPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    AppIndexedRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppIndexedPage(),
      );
    },
    AuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthPage(),
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomePage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    HomeRouterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const HomeRouterPage()),
      );
    },
    IncidentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const IncidentPage(),
      );
    },
    MapRoute.name: (routeData) {
      final args = routeData.argsAs<MapRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MapPage(
          key: args.key,
          doneWorkList: args.doneWorkList,
          fieldList: args.fieldList,
        ),
      );
    },
    NoticeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NoticePage(),
      );
    },
    ReportsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReportsPage(),
      );
    },
    SplashRouteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreenPage(),
      );
    },
    TaskRoute.name: (routeData) {
      final args = routeData.argsAs<TaskRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TaskPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
  };
}

/// generated route for
/// [AllPage]
class AllRoute extends PageRouteInfo<void> {
  const AllRoute({List<PageRouteInfo>? children})
      : super(
          AllRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AllTaskPage]
class AllTaskRoute extends PageRouteInfo<AllTaskRouteArgs> {
  AllTaskRoute({
    Key? key,
    required String id,
    List<PageRouteInfo>? children,
  }) : super(
          AllTaskRoute.name,
          args: AllTaskRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'AllTaskRoute';

  static const PageInfo<AllTaskRouteArgs> page =
      PageInfo<AllTaskRouteArgs>(name);
}

class AllTaskRouteArgs {
  const AllTaskRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'AllTaskRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [AppIndexedPage]
class AppIndexedRoute extends PageRouteInfo<void> {
  const AppIndexedRoute({List<PageRouteInfo>? children})
      : super(
          AppIndexedRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppIndexedRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthPage]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    required int? id,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<HomeRouteArgs> page = PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int? id;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [HomeRouterPage]
class HomeRouterRoute extends PageRouteInfo<void> {
  const HomeRouterRoute({List<PageRouteInfo>? children})
      : super(
          HomeRouterRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRouterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [IncidentPage]
class IncidentRoute extends PageRouteInfo<void> {
  const IncidentRoute({List<PageRouteInfo>? children})
      : super(
          IncidentRoute.name,
          initialChildren: children,
        );

  static const String name = 'IncidentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MapPage]
class MapRoute extends PageRouteInfo<MapRouteArgs> {
  MapRoute({
    Key? key,
    required List<DoneWork> doneWorkList,
    required List<Field> fieldList,
    List<PageRouteInfo>? children,
  }) : super(
          MapRoute.name,
          args: MapRouteArgs(
            key: key,
            doneWorkList: doneWorkList,
            fieldList: fieldList,
          ),
          initialChildren: children,
        );

  static const String name = 'MapRoute';

  static const PageInfo<MapRouteArgs> page = PageInfo<MapRouteArgs>(name);
}

class MapRouteArgs {
  const MapRouteArgs({
    this.key,
    required this.doneWorkList,
    required this.fieldList,
  });

  final Key? key;

  final List<DoneWork> doneWorkList;

  final List<Field> fieldList;

  @override
  String toString() {
    return 'MapRouteArgs{key: $key, doneWorkList: $doneWorkList, fieldList: $fieldList}';
  }
}

/// generated route for
/// [NoticePage]
class NoticeRoute extends PageRouteInfo<void> {
  const NoticeRoute({List<PageRouteInfo>? children})
      : super(
          NoticeRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoticeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReportsPage]
class ReportsRoute extends PageRouteInfo<void> {
  const ReportsRoute({List<PageRouteInfo>? children})
      : super(
          ReportsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreenPage]
class SplashRouteRoute extends PageRouteInfo<void> {
  const SplashRouteRoute({List<PageRouteInfo>? children})
      : super(
          SplashRouteRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRouteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TaskPage]
class TaskRoute extends PageRouteInfo<TaskRouteArgs> {
  TaskRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          TaskRoute.name,
          args: TaskRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'TaskRoute';

  static const PageInfo<TaskRouteArgs> page = PageInfo<TaskRouteArgs>(name);
}

class TaskRouteArgs {
  const TaskRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'TaskRouteArgs{key: $key, id: $id}';
  }
}
