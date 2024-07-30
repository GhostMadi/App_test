import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/core/resources/theme.dart';
import 'package:flutter_application_2/src/feature/app/router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppConfiguration();
  }
}

class AppConfiguration extends StatefulWidget {
  const AppConfiguration({super.key});

  @override
  State<AppConfiguration> createState() => _AppConfigurationState();
}

class _AppConfigurationState extends State<AppConfiguration> {
  final appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      title: 'AppOnTrackTest',
      routerConfig: appRouter.config(),
    );
  }
}
