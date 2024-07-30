// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/core/resources/app_colors.dart';
import 'package:flutter_application_2/src/core/resources/app_style.dart';
import 'package:flutter_application_2/src/core/widgets/column_spacer.dart';
import 'package:flutter_application_2/src/core/widgets/row_spacer.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/business_processes_logic/model/business_processes.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/model/done_work/done_work.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/equipment_logic/model/equipment.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/model/field.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/machines_login/model/machines.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/stuff_logic/model/staff.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/works_logic/model/works_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Item extends StatefulWidget {
  Field? field;
  final Works works;

  final DoneWork doneWork;
  final DetailStaff staff;
  final DetailsMachine machine;
  final Equipment equipment;
  final DetailBusinessProcess detailBusinessProcess;
  Item(
      {required this.doneWork,
      required this.field,
      required this.works,
      required this.detailBusinessProcess,
      required this.equipment,
      super.key,
      required this.staff,
      required this.machine});

  @override
  State<Item> createState() => _ItemState();
}

String toShortName(String name) {
  if (name.isNotEmpty) {
    List<String> splitedName = name.split(' ');
    String shortName =
        "${splitedName[0]} ${splitedName[1][0]}.${splitedName[2][0]}.";
    return shortName;
  }
  return '';
}

class _ItemState extends State<Item> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    String shortName = toShortName(widget.staff.name);
    String firstD = toDate(widget.doneWork.period![0]);
    String secondD = toDate(widget.doneWork.period![1]);
    String factArea = widget.field!.fact_area!.split('.')[0];
    String supervisorProgressVolume = widget.doneWork.supervisor_progress_volume
        .toString()
        .substring(0,
            widget.doneWork.supervisor_progress_volume.toString().indexOf('.'));
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          InkWell(
            splashColor: AppColors.primary50,
            onTap: () => setState(() {
              isExpanded = !isExpanded;
            }),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/svg/canceled.svg'),
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
                        '${widget.detailBusinessProcess.linked_object!.culture},${widget.field!.title.toString()}($factArea га)',
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              height: isExpanded == false ? 0 : 164,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: AppColors.primary50),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 15),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/images/svg/staff.svg'),
                              const RowSpacer(1),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.staff.name,
                                    style: AppStyle.textP212Mediumn
                                        .copyWith(color: AppColors.blackColor),
                                  ),
                                  Text(
                                    widget.staff.position,
                                    style: AppStyle.textP410Medium,
                                  )
                                ],
                              )
                            ],
                          ),
                          const ColumnSpacer(1),
                          Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/images/svg/transport.svg'),
                              const RowSpacer(1),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${widget.machine.brand.toString().toUpperCase()} (${widget.machine.model})',
                                    style: AppStyle.textP212Mediumn
                                        .copyWith(color: AppColors.blackColor),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${widget.machine.machine_type.localiztion}, $shortName (${widget.staff.position})',
                                        style: AppStyle.textP410Medium,
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          const ColumnSpacer(1),
                          Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/images/svg/equipment.svg'),
                              const RowSpacer(1),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${widget.equipment.brand.toString()} (${widget.equipment.model})',
                                    style: AppStyle.textP212Mediumn
                                        .copyWith(color: AppColors.blackColor),
                                  ),
                                  widget.equipment.width!.isEmpty
                                      ? const SizedBox()
                                      : Text(
                                          '${widget.equipment.width.toString()} m',
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

String toDate(String date) {
  DateTime time = DateTime.parse(date);
  DateFormat dataFormate = DateFormat('HH:mm dd.MM');
  String result = dataFormate.format(time).toString();
  return result;
}
