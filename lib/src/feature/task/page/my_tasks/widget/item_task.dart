// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/core/dependencies/injection_container.dart';
import 'package:flutter_application_2/src/core/resources/app_colors.dart';
import 'package:flutter_application_2/src/core/resources/app_style.dart';
import 'package:flutter_application_2/src/core/widgets/column_spacer.dart';
import 'package:flutter_application_2/src/core/widgets/row_spacer.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/bloc/done_work_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/model/done_work/done_work.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/repository/done_work_repository.dart';
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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class TasksWidget extends StatefulWidget {
  final String id;
  const TasksWidget({super.key, required this.id});

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  late DoneWorkBloc doneWorkBloc;
  late MachinesBloc machinesBloc;
  late StaffBloc staffBloc;
  late WorksBloc worksBloc;
  late FieldBloc fieldBloc;
  List<Works> filteredWorks = [];
  Field filteredField = Field.empty;
  DetailStaff? filteredStaff;
  List<DetailStaff> laistFilterStaff = [];

  DetailsMachine? filteredMachines;
  List<DetailsMachine> laistFilterdMachines = [];

  @override
  void initState() {
    super.initState();
    doneWorkBloc = DoneWorkBloc(doneWorkRepository: sl<DoneWorkRepository>());
    fieldBloc = FieldBloc(fieldRepository: sl<FieldRepository>());
    worksBloc = WorksBloc(worksRepository: sl<WorksRepository>());
    staffBloc = StaffBloc(staffRepository: sl<StaffRepository>());
    machinesBloc = MachinesBloc(machinesRepository: sl<MachinesRepository>());
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
                        //Works Bloc
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
                                        filteredField = listField.firstWhere(
                                            (field) =>
                                                field.id ==
                                                doneWorkList[index]
                                                    .linked_objects!
                                                    .field);
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
                                          filteredMachines =
                                              listMachines.firstWhere(
                                                  (machine) =>
                                                      machine.id ==
                                                      doneWork.machine,
                                                  orElse: () =>
                                                      DetailsMachine.empty);
                                          laistFilterdMachines
                                              .add(filteredMachines!);
                                        }
                                        log('${laistFilterdMachines[index].id.toString()} ====');
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
                                  })
                                ],
                                child: BlocBuilder<MachinesBloc, MachinesState>(
                                    builder: (context, state) {
                                  if (index < filteredWorks.length &&
                                      index < laistFilterStaff.length &&
                                      index < laistFilterdMachines.length) {
                                    return Item(
                                      doneWork: doneWorkList[index],
                                      field: filteredField,
                                      works: filteredWorks[index],
                                      staff: laistFilterStaff[index] ??
                                          DetailStaff.empty,
                                      machine: laistFilterdMachines[index] ??
                                          DetailsMachine.empty,
                                    );
                                  } else {
                                    return Container(); // или какой-то другой виджет-заглушка
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

String toDate(String date) {
  DateTime time = DateTime.parse(date);
  DateFormat dataFormate = DateFormat('HH:mm dd.MM');
  String result = dataFormate.format(time).toString();

  return result;
}

class Item extends StatefulWidget {
  Field? field;
  final Works works;
  final DoneWork doneWork;
  final DetailStaff staff;
  final DetailsMachine machine;
  Item(
      {required this.doneWork,
      required this.field,
      required this.works,
      super.key,
      required this.staff,
      required this.machine});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    String firstD = toDate(widget.doneWork.period![0]);
    String secondD = toDate(widget.doneWork.period![1]);
    String factArea = widget.field!.fact_area.split('.')[0];
    String supervisorProgressVolume = widget.doneWork.supervisor_progress_volume
        .toString()
        .substring(0,
            widget.doneWork.supervisor_progress_volume.toString().indexOf('.'));
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => setState(() {
              isExpanded = !isExpanded;
            }),
            child: Row(
              children: [
                SvgPicture.asset('assets/images/svg/cancelled.svg'),
                const RowSpacer(1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.works.name.toString(),
                      style: AppStyle.headingH216Medium
                          .copyWith(color: AppColors.blackColor),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/svg/clock.svg'),
                        Text(' $firstD  ${secondD.isEmpty ? " " : secondD}',
                            style: AppStyle.textP410Medium),
                      ],
                    ),
                    Text(
                      '${widget.field!.title.toString()}, ($factArea га)',
                      style: AppStyle.textP212Mediumn
                          .copyWith(color: AppColors.blackColor),
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.borderLine)),
                  child: Center(
                    child: Text(
                      '$supervisorProgressVolume га',
                      style: AppStyle.headingH216Medium
                          .copyWith(color: AppColors.text800),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              height: isExpanded == false
                  ? 0
                  // :
                  // widget.staff == null && widget.machines == null
                  //     ? 0
                  : 164,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: AppColors.primary50),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(),
                              const RowSpacer(1),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.staff.name.isEmpty
                                        ? 'unknown'
                                        : widget.staff.name,
                                    style: AppStyle.textP212Mediumn
                                        .copyWith(color: AppColors.blackColor),
                                  ),
                                  Text(
                                    widget.staff.position.isEmpty
                                        ? 'unknown'
                                        : widget.staff.position,
                                    style: AppStyle.textP410Medium,
                                  )
                                ],
                              )
                            ],
                          ),
                          const ColumnSpacer(1),
                          Row(
                            children: [
                              const CircleAvatar(),
                              const RowSpacer(1),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.machine.machine_type.localiztion,
                                    style: AppStyle.textP212Mediumn
                                        .copyWith(color: AppColors.blackColor),
                                  ),
                                  Text(
                                    'Механизатор, Производство',
                                    style: AppStyle.textP410Medium,
                                  )
                                ],
                              )
                            ],
                          ),
                          const ColumnSpacer(1),
                          Row(
                            children: [
                              const CircleAvatar(),
                              const RowSpacer(1),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Дисковая борона John Deere 2635',
                                    style: AppStyle.textP212Mediumn
                                        .copyWith(color: AppColors.blackColor),
                                  ),
                                  Text(
                                    'Механизатор, Производство',
                                    style: AppStyle.textP410Medium,
                                  )
                                ],
                              )
                            ],
                          )
                        ]),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
