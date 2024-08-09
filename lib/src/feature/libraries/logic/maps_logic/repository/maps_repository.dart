import 'package:dio/dio.dart';
import 'package:flutter_application_2/src/core/server/dio.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/maps_logic/model/map.dart';

abstract class MapsRepository {
  Future<List<DetailMap>> fetchMaps(String id);
}

class MapsRepoImpl extends MapsRepository {
  Dio dio = DioSettings().dio;

  @override
  Future<List<DetailMap>> fetchMaps(String id) async {
    Response response =
        await dio.get('/company/$id/maps/crops/', queryParameters: {
      'year': '2024',
      'company_id':id
    });

    return List.from(response.data.map((x)=>DetailMap.fromJson(x)));
  }
}
