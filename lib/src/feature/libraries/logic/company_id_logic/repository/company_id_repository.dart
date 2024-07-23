import 'package:dio/dio.dart';
import 'package:flutter_application_2/src/core/server/dio.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/company_id_logic/model/id/id_company.dart';

abstract class CompanyIdRepository {
  Future<List<IdCompany>> fetchCompanyId();
}

class CompanyIdRepoImpl extends CompanyIdRepository {
  Dio dio = DioSettings().dio;
  @override
  Future<List<IdCompany>> fetchCompanyId() async {
    Response response = await dio.get('/companies/');
    return List<IdCompany>.from(
        response.data.map((x) => IdCompany.fromJson(x)));
  }
}
