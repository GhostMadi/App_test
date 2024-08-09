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
    AllTaskRoute.name: (routeData) {
      final args = routeData.argsAs<AllTaskRouteArgs>(
          orElse: () => const AllTaskRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AllTaskPage(
          key: args.key,
          listDoneWork: args.listDoneWork,
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
          listMaps: args.listMaps,
          doneWorkList: args.doneWorkList,
          fieldList: args.fieldList,
        ),
      );
    },
    MyTaskRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyTaskPage(),
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
      final args =
          routeData.argsAs<TaskRouteArgs>(orElse: () => const TaskRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TaskPage(
          key: args.key,
          listField: args.listField,
          listDoneWork: args.listDoneWork,
          id: args.id,
        ),
      );
    },
  };
}

/// generated route for
/// [AllTaskPage]
class AllTaskRoute extends PageRouteInfo<AllTaskRouteArgs> {
  AllTaskRoute({
    Key? key,
    List<DoneWork>? listDoneWork,
    String? id,
    List<PageRouteInfo>? children,
  }) : super(
          AllTaskRoute.name,
          args: AllTaskRouteArgs(
            key: key,
            listDoneWork: listDoneWork,
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
    this.listDoneWork,
    this.id,
  });

  final Key? key;

  final List<DoneWork>? listDoneWork;

  final String? id;

  @override
  String toString() {
    return 'AllTaskRouteArgs{key: $key, listDoneWork: $listDoneWork, id: $id}';
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
    required List<DetailMap> listMaps,
    required List<DoneWork> doneWorkList,
    required List<Field> fieldList,
    List<PageRouteInfo>? children,
  }) : super(
          MapRoute.name,
          args: MapRouteArgs(
            key: key,
            listMaps: listMaps,
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
    required this.listMaps,
    required this.doneWorkList,
    required this.fieldList,
  });

  final Key? key;

  final List<DetailMap> listMaps;

  final List<DoneWork> doneWorkList;

  final List<Field> fieldList;

  @override
  String toString() {
    return 'MapRouteArgs{key: $key, listMaps: $listMaps, doneWorkList: $doneWorkList, fieldList: $fieldList}';
  }
}

/// generated route for
/// [MyTaskPage]
class MyTaskRoute extends PageRouteInfo<void> {
  const MyTaskRoute({List<PageRouteInfo>? children})
      : super(
          MyTaskRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyTaskRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
    List<Field>? listField,
    List<DoneWork>? listDoneWork,
    int? id,
    List<PageRouteInfo>? children,
  }) : super(
          TaskRoute.name,
          args: TaskRouteArgs(
            key: key,
            listField: listField,
            listDoneWork: listDoneWork,
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
    this.listField,
    this.listDoneWork,
    this.id,
  });

  final Key? key;

  final List<Field>? listField;

  final List<DoneWork>? listDoneWork;

  final int? id;

  @override
  String toString() {
    return 'TaskRouteArgs{key: $key, listField: $listField, listDoneWork: $listDoneWork, id: $id}';
  }
}
