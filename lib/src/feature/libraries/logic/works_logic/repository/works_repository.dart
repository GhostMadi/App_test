import 'package:dio/dio.dart';
import 'package:flutter_application_2/src/core/server/dio.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/works_logic/model/works_model.dart';

abstract class WorksRepository {
  Future<List<Works>> fetchWorks(String id);
}

class WorksRepoImpl extends WorksRepository {
  Dio dio = DioSettings().dio;
  @override
  Future<List<Works>> fetchWorks(String id) async {
    Response response = await dio.get('/company/$id/works/');
    return List<Works>.from(response.data.map((x) => Works.fromJson(x)));
  }
}
