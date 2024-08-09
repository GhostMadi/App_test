import 'package:flutter_application_2/src/feature/auth/logic/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_application_2/src/feature/auth/logic/bloc/refresh_bloc/refresh_bloc.dart';
import 'package:flutter_application_2/src/feature/auth/logic/repository/auth_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/maps_logic/bloc/maps_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/maps_logic/repository/maps_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/business_processes_logic/bloc/business_processes_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/business_processes_logic/repository/business_processes_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/company_id_logic/bloc/ids_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/company_id_logic/repository/company_id_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/bloc/done_works_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/repository/done_work_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/equipment_logic/bloc/equipments_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/equipment_logic/repository/equipment_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/bloc/fields_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/repository/field_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/machines_logic/bloc/detail_machines_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/machines_logic/repository/machines_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/stuff_logic/bloc/staff_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/stuff_logic/respository/staff_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/works_logic/bloc/detail_works_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/works_logic/repository/works_repository.dart';
import 'package:get_it/get_it.dart';


GetIt sl = GetIt.instance;



Future<void> initGetIt() async {
 
//   //bloc
  sl.registerFactory<AuthBloc>(
      () => AuthBloc(authRepository: sl<AuthRepoImpl>()));
  sl.registerFactory<IdsBloc>(
      () => IdsBloc(companyIdRepository: sl<CompanyIdRepository>()));
  sl.registerFactory<DoneWorksBloc>(
      () => DoneWorksBloc(doneWorkRepository: sl<DoneWorkRepository>()));
  sl.registerFactory<DetailWorksBloc>(
      () => DetailWorksBloc(worksRepository: sl<WorksRepository>()));
  sl.registerFactory<FieldsBloc>(
      () => FieldsBloc(fieldRepository: sl<FieldRepository>()));
  sl.registerFactory<RefreshBloc>(
      () => RefreshBloc(authRepository: sl<AuthRepository>()));
  sl.registerFactory<DetailMachinesBloc>(
      () => DetailMachinesBloc(machinesRepository: sl<MachinesRepository>()));
  sl.registerFactory<StaffBloc>(
      () => StaffBloc(staffRepository: sl<StaffRepository>()));
  sl.registerFactory<EquipmentsBloc>(
      () => EquipmentsBloc(equipmentRepository: sl<EquipmentRepository>()));
  sl.registerFactory<BusinessProcessesBloc>(() => BusinessProcessesBloc(
      businessProcessesRepository: sl<BusinessProcessesRepository>()));
  sl.registerFactory<MapsBloc>(
      () => MapsBloc(mapsRepository: sl<MapsRepository>()));

//   //repos
  sl.registerLazySingleton<AuthRepository>(() => AuthRepoImpl());
  sl.registerLazySingleton<CompanyIdRepository>(() => CompanyIdRepoImpl());
  sl.registerLazySingleton<DoneWorkRepository>(() => DoneWorkRepoImpl());
  sl.registerLazySingleton<WorksRepository>(() => WorksRepoImpl());
  sl.registerLazySingleton<FieldRepository>(() => FieldRepoImpl());
  sl.registerLazySingleton<MachinesRepository>(() => MachinesRepoImpl());
  sl.registerLazySingleton<StaffRepository>(() => StaffRepoImpl());
  sl.registerLazySingleton<EquipmentRepository>(() => EquipmentRepoImpl());
  sl.registerLazySingleton<BusinessProcessesRepository>(
      () => BusinessProcessesRepoImpl());
  sl.registerLazySingleton<MapsRepository>(() => MapsRepoImpl());
}
