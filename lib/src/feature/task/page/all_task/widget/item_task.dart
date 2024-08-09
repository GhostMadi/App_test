// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/core/resources/app_colors.dart';
import 'package:flutter_application_2/src/core/resources/app_style.dart';
import 'package:flutter_application_2/src/core/widgets/column_spacer.dart';
import 'package:flutter_application_2/src/core/widgets/row_spacer.dart';

import 'package:flutter_application_2/src/feature/task/page/all_task/model/task_info.dart';
import 'package:flutter_application_2/src/feature/task/page/all_task/pages/task_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Item extends StatefulWidget {
  TaskInfo? taskInfo;
  Item({super.key, this.taskInfo});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    String shortName = TaskFunctions.toShortName(widget.taskInfo!.staff);
    String firstD = TaskFunctions.toDate(widget.taskInfo!.to);
    String secondD = TaskFunctions.toDate(widget.taskInfo!.from);
    String factArea = widget.taskInfo!.factArea.split('.')[0];
    String supervisorProgressVolume = widget.taskInfo!.supervisorProgressVolume
        .toString()
        .substring(0, widget.taskInfo!.supervisorProgressVolume.indexOf('.'));

    Uint8List imageBytes = (widget.taskInfo!.iconMachine.isEmpty)
        ? Uint8List(0)
        : base64Decode(TaskFunctions.base64ToImage(
            widget.taskInfo!.iconMachine.toString()));

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
                        widget.taskInfo!.work.toString(),
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
                        '${TaskFunctions.toCulture(widget.taskInfo!.culture)},${widget.taskInfo!.field}($factArea га)',
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
                                    widget.taskInfo!.staff,
                                    style: AppStyle.textP212Mediumn
                                        .copyWith(color: AppColors.blackColor),
                                  ),
                                  Text(
                                    widget.taskInfo!.position,
                                    style: AppStyle.textP410Medium,
                                  )
                                ],
                              )
                            ],
                          ),
                          const ColumnSpacer(1),
                          Row(
                            children: [
                              imageBytes.isNotEmpty
                                  ? Image.memory(imageBytes,
                                      height: 32, width: 32)
                                  : SvgPicture.asset(
                                      'assets/images/svg/transport.svg'),
                              const RowSpacer(1),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${widget.taskInfo!.brandMachine.toString().toUpperCase()} (${widget.taskInfo!.brandMachine})',
                                    style: AppStyle.textP212Mediumn
                                        .copyWith(color: AppColors.blackColor),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${widget.taskInfo!.machineType}, $shortName (${widget.taskInfo!.position})',
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
                                    '${widget.taskInfo!.equipmentBrand} (${widget.taskInfo!.equipmentModel})',
                                    style: AppStyle.textP212Mediumn
                                        .copyWith(color: AppColors.blackColor),
                                  ),
                                  widget.taskInfo!.equipmentWidth.isEmpty
                                      ? const SizedBox()
                                      : Text(
                                          '${widget.taskInfo!.equipmentWidth.toString()} m',
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
