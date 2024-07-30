import 'package:dio/dio.dart';
import 'package:flutter_application_2/src/core/server/dio.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/business_processes_logic/model/business_processes.dart';

abstract class BusinessProcessesRepository{
  Future<DetailBusinessProcess> fetchBusinessProcesses(String idCompany,String id);
}


class BusinessProcessesRepoImpl extends BusinessProcessesRepository{
  Dio dio = DioSettings().dio;
  @override
  Future<DetailBusinessProcess> fetchBusinessProcesses(String idCompany, String id) async {
    Response response = await dio.get('/company/$idCompany/business_processes/$id/');
    return DetailBusinessProcess.fromJson(response.data);

  }
}