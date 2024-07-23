import 'package:auto_route/auto_route.dart';
import 'package:flutter_application_2/src/core/constatns/app_const.dart';
import 'package:flutter_application_2/src/core/storage/app_hive_settings.dart';
import 'package:flutter_application_2/src/feature/app/router/app_router.dart';

class AuthGuard extends AutoRouteGuard{
  @override
  void onNavigation(NavigationResolver resolver,StackRouter router){
    String token = AppHiveSettings.getStringValue(key: AppConstants.token);
      if(token.isNotEmpty){
        resolver.next();
      }else{
        resolver.redirect(const AuthRoute());
      }
  }
}