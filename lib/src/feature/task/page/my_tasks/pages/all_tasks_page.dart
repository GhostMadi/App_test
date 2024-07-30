
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/core/dependencies/injection_container.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/business_processes_logic/bloc/detail_business_process_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/business_processes_logic/model/business_processes.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/business_processes_logic/repository/business_processes_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/bloc/done_work_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/model/done_work/done_work.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/repository/done_work_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/equipment_logic/bloc/equipment_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/equipment_logic/model/equipment.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/equipment_logic/repository/equipment_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/bloc/field_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/model/field.dart';

import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/repository/field_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/machines_login/bloc/machines_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/machines_login/model/machines.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/machines_login/repository/machines_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/stuff_logic/bloc/staff_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/stuff_logic/model/staff.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/stuff_logic/respository/staff_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/works_logic/bloc/works_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/works_logic/model/works_model.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/works_logic/repository/works_repository.dart';
import 'package:flutter_application_2/src/feature/task/page/my_tasks/widget/item_task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
@RoutePage()

class AllTaskPage extends StatefulWidget {
  final String id;
  const AllTaskPage({super.key, required this.id});

  @override
  State<AllTaskPage> createState() => _AllTaskPageState();
}

class _AllTaskPageState extends State<AllTaskPage> {
  late DoneWorkBloc doneWorkBloc;
  late MachinesBloc machinesBloc;
  late EquipmentBloc equipmentBloc;
  late StaffBloc staffBloc;
  late WorksBloc worksBloc;
  late FieldBloc fieldBloc;
  late DetailBusinessProcessBloc detailBusinessProcessBloc;
  DetailStaff? filteredStaff;
  DetailBusinessProcess detailBusinessProcess = DetailBusinessProcess.empty;
  List<Field> filteredFieldList = [];
  List<Works> filteredWorks = [];
  List<DetailStaff> laistFilterStaff = [];
  List<DetailsMachine> laistFilterdMachines = [];
  List<Equipment> listfilterdEquipment = [];

  @override
  void initState() {
    super.initState();
    doneWorkBloc = DoneWorkBloc(doneWorkRepository: sl<DoneWorkRepository>());
    fieldBloc = FieldBloc(fieldRepository: sl<FieldRepository>());
    worksBloc = WorksBloc(worksRepository: sl<WorksRepository>());
    staffBloc = StaffBloc(staffRepository: sl<StaffRepository>());
    machinesBloc = MachinesBloc(machinesRepository: sl<MachinesRepository>());
    equipmentBloc =
        EquipmentBloc(equipmentRepository: sl<EquipmentRepository>());
    detailBusinessProcessBloc = DetailBusinessProcessBloc(
        businessProcessesRepository: sl<BusinessProcessesRepository>());
  }

  @override
  Widget build(BuildContext context) {
    //doneWorks bloc
    return BlocProvider.value(
        value: doneWorkBloc..add(DoneWorkFetch(id: widget.id)),
        child: BlocConsumer<DoneWorkBloc, DoneWorkState>(
            listener: (context, state) {
          if (state is DoneWorkFailed) {
            log('DoneWork failed.');
            log(state.e.toString());
          } else if (state is DoneWorkSuccess) {
            log(state.doneWorks.first.brigades!.first.staff.toString());
            log('DoneWork success.');
          } else if (state is DoneWorkLoading) {
            log('DoneWork loading...');
          } else {
            log('error');
          }
        }, builder: (context, state) {
          if (state is DoneWorkSuccess) {
            List<DoneWork> doneWorkList = state.doneWorks;
            log(doneWorkList.first.period.toString());
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: state.doneWorks.length,
                      itemBuilder: (context, index) {
                        return MultiBlocProvider(
                            providers: [
                              BlocProvider.value(
                                  value: worksBloc
                                    ..add(WorksFetch(id: widget.id))),
                              BlocProvider.value(
                                  value: fieldBloc
                                    ..add(FieldFetch(id: widget.id))),
                              BlocProvider.value(
                                  value: staffBloc
                                    ..add(StaffFetch(id: widget.id))),
                              BlocProvider.value(
                                  value: machinesBloc
                                    ..add(MachinessFetch(id: widget.id))),
                              BlocProvider.value(
                                  value: equipmentBloc
                                    ..add(EquipmentFetch(id: widget.id))),
                              BlocProvider.value(
                                  value: detailBusinessProcessBloc
                                    ..add(FetchDetailBusinessProcess(
                                        idCompany: widget.id,
                                        id: doneWorkList[index]
                                            .linked_objects!
                                            .business_process
                                            .toString())))
                            ],
                            child: MultiBlocListener(
                                listeners: [
                                  BlocListener<WorksBloc, WorksState>(
                                      listener: (context, state) {
                                    if (state is WorksFailed) {
                                      log(state.e.message);
                                    } else if (state is WorksLoading) {
                                      log('works Fetch Loading');
                                    } else if (state is WorksSuccess) {
                                      List<Works> listWorks = state.worksList;
                                      if (listWorks.isNotEmpty) {
                                        filteredWorks = listWorks
                                            .where((work) {
                                              return doneWorkList.any(
                                                  (doneWork) =>
                                                      work.id == doneWork.work);
                                            })
                                            .toList()
                                            .reversed
                                            .toList();
                                      }
                                    }
                                  }),
                                  BlocListener<FieldBloc, FieldState>(
                                      listener: (context, state) {
                                    if (state is FieldFailed) {
                                      log(state.e.message);
                                    } else if (state is FieldLoading) {
                                      log('fieled Fetch Loading');
                                    } else if (state is FieldSuccess) {
                                      log('field fetch success');

                                      List<Field> listField = state.listField;
                                      if (listField.isNotEmpty) {
                                        Field filteredField =
                                            listField.firstWhere(
                                                (field) =>
                                                    field.id ==
                                                    doneWorkList[index]
                                                        .linked_objects!
                                                        .field,
                                                orElse: () => Field.empty);
                                        filteredFieldList.add(filteredField);
                                      }
                                      
                                    }
                                  }),
                                  BlocListener<MachinesBloc, MachinesState>(
                                      listener: (context, state) {
                                    if (state is MachinesFailed) {
                                      log(state.e.toString());
                                    } else if (state is MachinesSuccess) {
                                      List<DetailsMachine> listMachines =
                                          state.machinesList;
                                      if (listMachines.isNotEmpty) {
                                        for (var doneWork in doneWorkList) {
                                          DetailsMachine filteredMachines =
                                              listMachines.firstWhere(
                                                  (machine) =>
                                                      machine.id ==
                                                      doneWork.machine,
                                                  orElse: () =>
                                                      DetailsMachine.empty);
                                          laistFilterdMachines
                                              .add(filteredMachines);
                                        }
                                      }
                                    }
                                  }),
                                  BlocListener<StaffBloc, StaffState>(
                                      listener: (contex, state) {
                                    if (state is StaffFailed) {
                                      log(state.e.message);
                                    } else if (state is StaffSuccess) {
                                      List<DetailStaff> listStaff =
                                          state.staffList;
                                      if (listStaff.isNotEmpty) {
                                        for (var doneWork in doneWorkList) {
                                          if (doneWork.brigades!.isNotEmpty) {
                                            DetailStaff staff =
                                                listStaff.firstWhere((staff) =>
                                                    staff.id ==
                                                    doneWork
                                                        .brigades!.first.staff);
                                            laistFilterStaff.add(staff);
                                          } else if (doneWork
                                              .brigades!.isEmpty) {
                                            laistFilterStaff
                                                .add(DetailStaff.empty);
                                          }
                                        }
                                      }
                                    }
                                  }),
                                  BlocListener<EquipmentBloc, EquipmentState>(
                                      listener: (context, state) {
                                    if (state is EquipmentFailed) {
                                      log(state.e.message.toString());
                                    } else if (state is EquipmentSuccess) {
                                      List<Equipment> listEquipment =
                                          state.eqipments;
                                      if (listEquipment.isNotEmpty) {
                                        for (var doneWork in doneWorkList) {
                                          Equipment equipment =
                                              listEquipment.firstWhere(
                                                  (equip) =>
                                                      equip.id ==
                                                      doneWork.equipment,
                                                  orElse: () =>
                                                      Equipment.empty);
                                          listfilterdEquipment.add(equipment);
                                        }
                                      }
                                    }
                                  }),
                                  BlocListener<DetailBusinessProcessBloc,
                                          DetailBusinessProcessState>(
                                      listener: (context, state) {
                                    if (state is BetailBusinessProcessFailed) {
                                      log(state.e.message);
                                    } else if (state
                                        is BetailBusinessProcessSuccess) {
                                      detailBusinessProcess =
                                          state.businessProcess;
                                    }
                                  })
                                ],
                                child: BlocBuilder<MachinesBloc, MachinesState>(
                                    builder: (context, state) {
                                  if (index < filteredWorks.length &&
                                      index < filteredFieldList.length &&
                                      index < laistFilterStaff.length &&
                                      index < laistFilterdMachines.length &&
                                      index < listfilterdEquipment.length) {
                                    return Item(
                                        detailBusinessProcess:
                                            detailBusinessProcess,
                                        equipment: listfilterdEquipment[index],
                                        doneWork: doneWorkList[index],
                                        field: filteredFieldList[index],
                                        works: filteredWorks[index],
                                        staff: laistFilterStaff[index],
                                        machine: laistFilterdMachines[index]);
                                  } else {
                                    return const SizedBox();
                                  }
                                })));
                      }),
                )
              ],
            );
          } else if (state is DoneWorkLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DoneWorkFailed) {
            return const Center(child: Text('system error.'));
          } else {
            return const Center(child: Text('system error.'));
          }
        }));
  }
}