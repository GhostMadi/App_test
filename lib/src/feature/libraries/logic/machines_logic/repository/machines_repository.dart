

import 'package:dio/dio.dart';
import 'package:flutter_application_2/src/core/server/dio.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/machines_logic/model/machines.dart';

abstract class MachinesRepository {
  Future<List<DetailsMachine>> fetchMachine(String id);
}

class MachinesRepoImpl extends MachinesRepository {
  Dio dio = DioSettings().dio;

  @override
  Future<List<DetailsMachine>> fetchMachine(String id) async {
    Response response = await dio.get('/company/$id/machines/');

    return List<DetailsMachine>.from(
        response.data.map((x) => DetailsMachine.fromJson(x)));
  }
}
