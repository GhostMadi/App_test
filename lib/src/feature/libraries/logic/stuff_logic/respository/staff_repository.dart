import 'package:dio/dio.dart';
import 'package:flutter_application_2/src/core/server/dio.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/stuff_logic/model/staff.dart';

abstract class StaffRepository {
  Future<List<DetailStaff>> fetchStaff(String id);
}

class StaffRepoImpl extends StaffRepository {
  Dio dio = DioSettings().dio;

  @override
  Future<List<DetailStaff>> fetchStaff(String id) async {
    Response response = await dio.get('/company/$id/staff/');
    return List<DetailStaff>.from(
        response.data.map((x) => DetailStaff.fromJson(x)));
  }
}
