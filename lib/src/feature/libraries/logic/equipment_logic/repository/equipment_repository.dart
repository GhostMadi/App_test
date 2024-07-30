import 'package:dio/dio.dart';
import 'package:flutter_application_2/src/core/server/dio.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/equipment_logic/model/equipment.dart';

abstract class EquipmentRepository{
  Future<List<Equipment>> fetchEquipment(String id);
}

class EquipmentRepoImpl extends EquipmentRepository{
  Dio dio =DioSettings().dio;
  @override
  Future<List<Equipment>> fetchEquipment(String id) async{
    Response response = await dio.get('/company/$id/equipment/');
    return List<Equipment>.from(response.data.map((x)=>Equipment.fromJson(x)));
  }
}