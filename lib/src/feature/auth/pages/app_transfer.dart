import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/core/constatns/app_const.dart';
import 'package:flutter_application_2/src/core/dependencies/injection_container.dart';
import 'package:flutter_application_2/src/core/storage/app_hive_settings.dart';
import 'package:flutter_application_2/src/feature/app/router/app_router.dart';
import 'package:flutter_application_2/src/feature/auth/logic/bloc/refresh_bloc/refresh_bloc.dart';
import 'package:flutter_application_2/src/feature/auth/logic/repository/auth_repository.dart';

@RoutePage()
class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  late RefreshBloc refreshBloc;
  @override
  void initState() {
    super.initState();
    refreshBloc = RefreshBloc(authRepository: sl<AuthRepository>())
      ..add(Refresh());
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    if (AppHiveSettings.getStringValue(key: AppConstants.token) == null) {
      context.router.replace(const AuthRoute());
    } else {
      context.router.replace(const AppIndexedRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
