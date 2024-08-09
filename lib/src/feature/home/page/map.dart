import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/generated/l10n.dart';
import 'package:flutter_application_2/src/core/resources/app_colors.dart';
import 'package:flutter_application_2/src/core/resources/app_style.dart';
import 'package:flutter_application_2/src/feature/home/page/map_provider.dart';
import 'package:flutter_application_2/src/feature/home/widget/map_element.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/model/done_work/done_work.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/model/field.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/maps_logic/model/map.dart';
import 'package:flutter_application_2/src/feature/task/page/all_task/pages/task_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

@RoutePage()
class MapPage extends StatefulWidget {
  final List<DoneWork> doneWorkList;
  final List<DetailMap> listMaps;
  final List<Field> fieldList;

  const MapPage(
      {super.key,
      required this.listMaps,
      required this.doneWorkList,
      required this.fieldList});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  bool isShow = false;
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    List<Field> filterdListField = widget.fieldList.where((field) {
      return widget.doneWorkList
          .any((work) => field.id == work.linked_objects!.field);
    }).toList();
    List<DetailMap> filteredListMap = widget.listMaps.where((map) {
      return widget.doneWorkList
          .any((work) => map.id == work.linked_objects!.business_process);
    }).toList();

    double sumFields = filterdListField
        .map((x) => double.parse(x.fact_area!))
        .toList()
        .reduce((a, b) => a + b);
    double sumCrops = filteredListMap
        .map((x) => double.parse(x.fact_area!))
        .toList()
        .reduce((a, b) => a + b);

   

    return ChangeNotifierProvider(
        create: (_) => MapProvider()
          ..createPolygon(
              selected == 0 ? filterdListField : filteredListMap,
              selected == 0
                  ? filterdListField
                      .map((field) => field.title.toString())
                      .toList()
                  : filteredListMap
                      .map((x) => TaskFunctions.toCulture(x.culture.toString()))
                      .toList()),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.appBarBackgoundColor,
            title: Text(
              S.of(context).appBarMap,
              style: AppStyle.headingH118SemiBold,
            ),
          ),
          body: Consumer<MapProvider>(
            builder: (context, mapProvider, child) => Stack(
              children: [
                GoogleMap(
                    myLocationButtonEnabled: true,
                    markers: context.read<MapProvider>().myMarkers,
                    mapType: context.read<MapProvider>().mapType,
                    myLocationEnabled: true,
                    polygons: context.read<MapProvider>().polygons,
                    onMapCreated: (controller) {
                      setState(() {
                        context.read<MapProvider>().onMapCreated(controller);
                        mapProvider;
                      });
                    },
                    initialCameraPosition: const CameraPosition(
                        target: LatLng(53.296205173841145, 69.16685579956297),
                        zoom: 13)),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: GestureDetector(
                    onTap: () => setState(() => isShow = !isShow),
                    child: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                        child:
                            SvgPicture.asset('assets/images/svg/formate.svg'),
                      ),
                    ),
                  ),
                ),
                isShow
                    ? Positioned(
                        top: 80,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 163,
                              height: 80,
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: 2,
                                  itemBuilder: (context, index) {
                                    return MapElement(
                                        onTap: (x) => setState(() {
                                              selected = x;
                                              log('ui ux $selected');
                                              mapProvider.createPolygon(
                                                  selected == 0
                                                      ? filterdListField
                                                      : filteredListMap,
                                                  selected == 0
                                                      ? filterdListField
                                                          .map((field) => field
                                                              .title
                                                              .toString())
                                                          .toList()
                                                      : filteredListMap
                                                          .map((x) => TaskFunctions
                                                              .toCulture(x
                                                                  .culture
                                                                  .toString()))
                                                          .toList());

                                              log('provider $selected');
                                            }),
                                        selected: selected,
                                        sumArea: index == 0
                                            ? sumFields.toInt()
                                            : sumCrops.toInt(),
                                        title: index == 0 ? 'Поля ' : 'Посевы',
                                        index: index,
                                        svgIcon: index == 0
                                            ? "assets/images/svg/field.svg"
                                            : "assets/images/svg/crops.svg",
                                        count: index == 0
                                            ? filterdListField.length
                                            : filteredListMap.length);
                                  }),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ));
  }
}
