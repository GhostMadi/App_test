import 'package:dio/dio.dart';
import 'package:flutter_application_2/src/core/constatns/app_const.dart';
import 'package:flutter_application_2/src/core/storage/app_hive_settings.dart';

class DioSettings{
  Dio dio = Dio()
    ..options = BaseOptions(
      baseUrl: AppConstants.mainServer,
      headers: <String, String>{
        'accept': 'application/json',
        "content-type": "application/json",
        'authorization':
            'Bearer ${AppHiveSettings.getStringValue(key:AppConstants.token) ?? ''}',
      },
    );

}