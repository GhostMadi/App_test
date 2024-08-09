import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/core/dependencies/injection_container.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/business_processes_logic/bloc/business_processes_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/business_processes_logic/model/business_processes.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/business_processes_logic/repository/business_processes_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/bloc/done_works_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/model/done_work/done_work.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/repository/done_work_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/equipment_logic/bloc/equipments_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/equipment_logic/model/equipment.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/equipment_logic/repository/equipment_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/bloc/fields_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/model/field.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/repository/field_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/machines_logic/bloc/detail_machines_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/machines_logic/model/machines.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/machines_logic/repository/machines_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/stuff_logic/bloc/staff_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/stuff_logic/model/staff.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/stuff_logic/respository/staff_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/works_logic/bloc/detail_works_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/works_logic/model/works_model.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/works_logic/repository/works_repository.dart';
import 'package:flutter_application_2/src/feature/task/page/all_task/model/task_info.dart';
import 'package:flutter_application_2/src/feature/task/page/all_task/widget/item_task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class AllTaskPage extends StatefulWidget {
  List<DoneWork>? listDoneWork;
  String? id;
  AllTaskPage({super.key, this.listDoneWork, this.id});

  @override
  State<AllTaskPage> createState() => _AllTaskPageState();
}

class _AllTaskPageState extends State<AllTaskPage> {
  late DoneWorksBloc doneWorksBloc;
  late DetailMachinesBloc detailMachinesBloc;
  late EquipmentsBloc equipmentsBloc;
  late StaffBloc staffBloc;
  late DetailWorksBloc worksBloc;
  late FieldsBloc fieldBloc;
  late BusinessProcessesBloc businessProcessesBloc;
  DetailStaff? filteredStaff;
  DetailBusinessProcess detailBusinessProcess = DetailBusinessProcess.empty;
  List<Works> filteredWorks = [];
  List<Field> filteredListField = [];
  List<DetailStaff> filterdListStaff = [];
  List<DetailsMachine> filteredListMachine = [];
  List<Equipment> filteredListEquipment = [];

  @override
  void initState() {
    super.initState();
    doneWorksBloc = DoneWorksBloc(doneWorkRepository: sl<DoneWorkRepository>());
    fieldBloc = FieldsBloc(fieldRepository: sl<FieldRepository>());
    worksBloc = DetailWorksBloc(worksRepository: sl<WorksRepository>());
    staffBloc = StaffBloc(staffRepository: sl<StaffRepository>());
    detailMachinesBloc =
        DetailMachinesBloc(machinesRepository: sl<MachinesRepository>());
    equipmentsBloc =
        EquipmentsBloc(equipmentRepository: sl<EquipmentRepository>());
    businessProcessesBloc = BusinessProcessesBloc(
        businessProcessesRepository: sl<BusinessProcessesRepository>());
  }

  List<DoneWork> toDated(List<DoneWork> listDoneWork) {
    List<DoneWork> modifiableList = List.from(listDoneWork);

    modifiableList.sort((a, b) => a.period![0].compareTo(b.period![0]));
    return modifiableList;
  }

  @override
  Widget build(BuildContext context) {
    List<DoneWork> doneWorkList =
        toDated(widget.listDoneWork!).reversed.toList();
    String id = widget.id!;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: doneWorkList.length,
              itemBuilder: (context, index) {
                return MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                          value: fieldBloc
                            ..add(FieldsEvent.fetchFields(id: id))),
                      BlocProvider.value(
                          value: worksBloc
                            ..add(DetailWorksEvent.fetchWorks(id: id))),
                      BlocProvider.value(
                          value: staffBloc..add(StaffEvent.fetchStaff(id: id))),
                      BlocProvider.value(
                          value: detailMachinesBloc
                            ..add(DetailMachinesEvent.fetchMachines(id: id))),
                      BlocProvider.value(
                          value: equipmentsBloc
                            ..add(EquipmentsEvent.fetchEquipment(id: id))),
                      BlocProvider.value(
                          value: businessProcessesBloc
                            ..add(BusinessProcessesEvent.fetchBusProcesses(
                                idCompany: id,
                                id: doneWorkList[index]
                                    .linked_objects!
                                    .business_process
                                    .toString())))
                    ],
                    child: MultiBlocListener(
                        listeners: [
                          BlocListener<FieldsBloc, FieldsState>(
                              listener: (context, state) => state.maybeWhen(
                                  orElse: () => log('something wrong'),
                                  failed: (error) => log(error.message),
                                  success: (listFields) {
                                    if (listFields.isNotEmpty) {
                                      for (var doneWork in doneWorkList) {
                                        Field field = listFields.firstWhere(
                                            (field) =>
                                                field.id ==
                                                doneWork.linked_objects!.field);
                                        filteredListField.add(field);
                                      }
                                    }
                                    return null;
                                  })),
                          BlocListener<DetailWorksBloc, DetailWorksState>(
                              listener: (context, state) => state.maybeWhen(
                                  orElse: () => log('something wrong'),
                                  failed: (error) => log(error.message),
                                  success: (listWork) {
                                    if (listWork.isNotEmpty) {
                                      Works work = listWork.firstWhere(
                                          (work) =>
                                              work.id ==
                                              doneWorkList[index].work,
                                          orElse: () => Works.empty);
                                      filteredWorks.add(work);
                                    }
                                    return null;
                                  })),
                          BlocListener<DetailMachinesBloc, DetailMachinesState>(
                              listener: (context, state) => state.maybeWhen(
                                  orElse: () => log('something wrong'),
                                  success: (listMachines) {
                                    setState(() {});
                                    if (listMachines.isNotEmpty) {
                                      DetailsMachine filteredMachines =
                                          listMachines.firstWhere(
                                              (machine) =>
                                                  machine.id ==
                                                  doneWorkList[index].machine,
                                              orElse: () =>
                                                  DetailsMachine.empty);
                                      filteredListMachine.add(filteredMachines);
                                    }
                                    return null;
                                  })),
                          BlocListener<StaffBloc, StaffState>(
                              listener: (context, state) => state.maybeWhen(
                                  orElse: () => log('something wrong'),
                                  success: (listStaff) {
                                    if (listStaff.isNotEmpty) {
                                      if (doneWorkList[index]
                                          .brigades!
                                          .isNotEmpty) {
                                        DetailStaff staff =
                                            listStaff.firstWhere(
                                                (staff) =>
                                                    staff.id ==
                                                    doneWorkList[index]
                                                        .brigades!
                                                        .first
                                                        .staff,
                                                orElse: () =>
                                                    DetailStaff.empty);
                                        filterdListStaff.add(staff);
                                      }
                                    }
                                    return null;
                                  })),
                          BlocListener<EquipmentsBloc, EquipmentsState>(
                              listener: (context, state) => state.maybeWhen(
                                  orElse: () => log('someShint wrong'),
                                  success: (listEquipment) {
                                    if (listEquipment.isNotEmpty) {
                                      for (var doneWork in doneWorkList) {
                                        Equipment equipment =
                                            listEquipment.firstWhere(
                                                (equip) =>
                                                    equip.id ==
                                                    doneWork.equipment,
                                                orElse: () => Equipment.empty);
                                        filteredListEquipment.add(equipment);
                                      }
                                    }
                                    return null;
                                  })),
                          BlocListener<BusinessProcessesBloc,
                                  BusinessProcessesState>(
                              listener: (context, state) => state.maybeWhen(
                                  orElse: () => log('something wrong'),
                                  success: (businessProcess) =>
                                      detailBusinessProcess = businessProcess))
                        ],
                        child: index < doneWorkList.length &&
                                index < filteredWorks.length &&
                                index < filteredListMachine.length &&
                                index < filterdListStaff.length &&
                                index < filteredListEquipment.length
                            ? Item(
                                taskInfo: TaskInfo(
                                work: filteredWorks[index].name ?? '',
                                from: doneWorkList[index].period![0] ?? '',
                                to: doneWorkList[index].period![1] ?? '',
                                culture: detailBusinessProcess
                                            .linked_object!.culture
                                            .toString() ==
                                        ''
                                    ? ''
                                    : detailBusinessProcess
                                        .linked_object!.culture
                                        .toString(),
                                field:
                                    filteredListField[index].title.toString(),
                                factArea: filteredListField[index]
                                    .fact_area
                                    .toString(),
                                supervisorProgressVolume: doneWorkList[index]
                                    .supervisor_progress_volume
                                    .toString(),
                                staff: filterdListStaff[index].name,
                                position: filterdListStaff[index].position,
                                iconMachine:
                                    filteredListMachine[index].icon_base_64 ==
                                            null
                                        ? ''
                                        : filteredListMachine[index]
                                            .icon_base_64
                                            .toString(),
                                machineType: filteredListMachine[index]
                                    .machine_type!
                                    .localiztion,
                                brandMachine:
                                    filteredListMachine[index].brand.toString(),
                                modelMachine:
                                    filteredListMachine[index].model.toString(),
                                equipmentBrand: filteredListEquipment[index]
                                    .brand
                                    .toString(),
                                equipmentModel: filteredListEquipment[index]
                                    .model
                                    .toString(),
                                equipmentWidth: filteredListEquipment[index]
                                    .width
                                    .toString(),
                              ))
                            : Shimmer.fromColors(
                                baseColor: Colors.grey.withOpacity(0.1),
                                highlightColor: Colors.black.withOpacity(0.1),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 1),
                                  child: Container(
                                    color: Colors.grey.withOpacity(1),
                                    height: 80,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                              )));
              }),
        )
      ],
    );
  }
}
