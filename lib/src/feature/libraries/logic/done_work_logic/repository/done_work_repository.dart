import 'package:dio/dio.dart';
import 'package:flutter_application_2/src/core/server/dio.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/model/done_work/done_work.dart';

abstract class DoneWorkRepository {
  Future<List<DoneWork>> fetchDoneWorks(String id);
}

class DoneWorkRepoImpl extends DoneWorkRepository {
  Dio dio = DioSettings().dio;
  @override
  Future<List<DoneWork>> fetchDoneWorks(String id) async {
    Response response =
        await dio.get('/company/$id/done_works/', queryParameters: {
      'time_from': '2023-04-11 00:00:00',
      'time_to': '2024-06-11 00:00:00',
      'company_id': id
    });
    return List<DoneWork>.from(response.data.map((x) => DoneWork.fromJson(x)));
  }
}
