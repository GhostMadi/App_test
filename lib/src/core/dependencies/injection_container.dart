// import 'package:flutter_application_2/src/feature/auth/logic/bloc/auth_bloc/auth_bloc.dart';
// import 'package:flutter_application_2/src/feature/auth/logic/bloc/refresh_bloc/refresh_bloc.dart';
// import 'package:flutter_application_2/src/feature/auth/logic/repository/auth_repo_impl.dart';
// import 'package:flutter_application_2/src/feature/auth/logic/repository/auth_repository.dart';
// import 'package:flutter_application_2/src/feature/task/page/my_tasks/logic/done_work_logic/bloc/done_work_bloc.dart';
// import 'package:flutter_application_2/src/feature/task/page/my_tasks/logic/fetch_id_logic/bloc/id_bloc/fetch_id_bloc.dart';
// import 'package:flutter_application_2/src/feature/task/page/my_tasks/logic/works_logic/bloc/task_bloc/task_response_bloc.dart';
// import 'package:flutter_application_2/src/feature/task/page/my_tasks/logic/done_work_logic/repository/done_work_repository.dart';
// import 'package:flutter_application_2/src/feature/task/page/my_tasks/logic/done_work_logic/repository/repository/task_repository.dart';
// import 'package:get_it/get_it.dart';

import 'package:flutter_application_2/src/feature/auth/logic/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_application_2/src/feature/auth/logic/bloc/refresh_bloc/refresh_bloc.dart';
import 'package:flutter_application_2/src/feature/auth/logic/repository/auth_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/business_processes_logic/bloc/detail_business_process_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/business_processes_logic/repository/business_processes_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/company_id_logic/bloc/fetch_id_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/company_id_logic/repository/company_id_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/bloc/done_work_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/repository/done_work_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/equipment_logic/bloc/equipment_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/equipment_logic/repository/equipment_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/bloc/field_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/repository/field_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/machines_login/bloc/machines_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/machines_login/repository/machines_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/stuff_logic/bloc/staff_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/stuff_logic/respository/staff_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/works_logic/bloc/works_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/works_logic/repository/works_repository.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> initGetIt() async {
//   //bloc
  sl.registerFactory<AuthBloc>(
      () => AuthBloc(authRepository: sl<AuthRepoImpl>()));
  sl.registerFactory<FetchIdBloc>(
      () => FetchIdBloc(companyIdRepository: sl<CompanyIdRepository>()));
  sl.registerFactory<DoneWorkBloc>(
      () => DoneWorkBloc(doneWorkRepository: sl<DoneWorkRepository>()));
  sl.registerFactory<WorksBloc>(
      () => WorksBloc(worksRepository: sl<WorksRepository>()));
  sl.registerFactory<FieldBloc>(
      () => FieldBloc(fieldRepository: sl<FieldRepository>()));
  sl.registerFactory<RefreshBloc>(
      () => RefreshBloc(authRepository: sl<AuthRepository>()));
  sl.registerFactory<MachinesBloc>(
      () => MachinesBloc(machinesRepository: sl<MachinesRepository>()));
  sl.registerFactory<StaffBloc>(
      () => StaffBloc(staffRepository: sl<StaffRepository>()));
  sl.registerFactory<EquipmentBloc>(()=>EquipmentBloc(equipmentRepository: sl<EquipmentRepository>()));
   sl.registerFactory<DetailBusinessProcessBloc>(()=>DetailBusinessProcessBloc(businessProcessesRepository: sl<BusinessProcessesRepository>()));

//   //repos
  sl.registerLazySingleton<AuthRepository>(() => AuthRepoImpl());
  sl.registerLazySingleton<CompanyIdRepository>(() => CompanyIdRepoImpl());
  sl.registerLazySingleton<DoneWorkRepository>(() => DoneWorkRepoImpl());
  sl.registerLazySingleton<WorksRepository>(() => WorksRepoImpl());
  sl.registerLazySingleton<FieldRepository>(() => FieldRepoImpl());
  sl.registerLazySingleton<MachinesRepository>(() => MachinesRepoImpl());
  sl.registerLazySingleton<StaffRepository>(() => StaffRepoImpl());
  sl.registerLazySingleton<EquipmentRepository>(()=>EquipmentRepoImpl());
  sl.registerLazySingleton<BusinessProcessesRepository>(()=>BusinessProcessesRepoImpl());
}
