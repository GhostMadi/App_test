import 'package:dio/dio.dart';
import 'package:flutter_application_2/src/core/server/dio.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/model/field.dart';

abstract class FieldRepository {
  Future<List<Field>> fetchField(String id);
}

class FieldRepoImpl extends FieldRepository {
  Dio dio = DioSettings().dio;
  @override
  Future<List<Field>> fetchField(String id) async {
    Response response = await dio.get(
      '/company/$id/fields/',
    );
    return List<Field>.from(response.data.map((x) => Field.fromJson(x)));
  }
}
