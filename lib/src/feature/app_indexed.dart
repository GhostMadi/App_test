// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/generated/l10n.dart';
import 'package:flutter_application_2/src/core/dependencies/injection_container.dart';
import 'package:flutter_application_2/src/core/resources/app_colors.dart';
import 'package:flutter_application_2/src/feature/app/router/app_router.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/company_id_logic/bloc/ids_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/company_id_logic/repository/company_id_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/bloc/done_works_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/model/done_work/done_work.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/repository/done_work_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/bloc/fields_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/model/field.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/repository/field_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/maps_logic/bloc/maps_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/maps_logic/model/map.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/maps_logic/repository/maps_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

//BlocProvider
@RoutePage()
class AppIndexedPage extends StatefulWidget {
  const AppIndexedPage({super.key});

  @override
  State<AppIndexedPage> createState() => _AppIndexedPageState();
}

class _AppIndexedPageState extends State<AppIndexedPage> {
  late IdsBloc idsBloc;
  late DoneWorksBloc doneWorkBloc;
  late FieldsBloc fieldsBloc;
  late MapsBloc mapsBloc;
  @override
  void initState() {
    super.initState();
    mapsBloc = MapsBloc(mapsRepository: sl<MapsRepository>());
    fieldsBloc = FieldsBloc(fieldRepository: sl<FieldRepository>());
    doneWorkBloc = DoneWorksBloc(doneWorkRepository: sl<DoneWorkRepository>());
    idsBloc = IdsBloc(companyIdRepository: sl<CompanyIdRepository>())
      ..add(const IdsEvent.fetchIds());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: idsBloc,
        child: BlocBuilder<IdsBloc, IdsState>(
            builder: (context, state) => state.maybeWhen(
                orElse: () => const Center(child: CircularProgressIndicator()),
                success: (ids) {
                  int id = ids[1].id;
                  return MultiBlocProvider(
                      providers: [
                        BlocProvider.value(
                            value: doneWorkBloc
                              ..add(DoneWorksEvent.fetchDoneWorks(
                                  id: id.toString()))),
                        BlocProvider.value(
                            value: fieldsBloc
                              ..add(
                                  FieldsEvent.fetchFields(id: id.toString()))),
                        BlocProvider.value(
                            value: mapsBloc
                              ..add(MapsEvent.fetchMaps(id: id.toString())))
                      ],
                      child: BlocBuilder<DoneWorksBloc, DoneWorksState>(
                          builder: (context, state) => state.maybeWhen(
                              orElse: () => const Center(
                                  child: CircularProgressIndicator()),
                              success: (listDoneWork) => BlocBuilder<FieldsBloc,
                                      FieldsState>(
                                  builder: (context, state) => state.maybeWhen(
                                      orElse: () => const Center(
                                          child: CircularProgressIndicator()),
                                      success: (listFieled) => BlocBuilder<
                                              MapsBloc, MapsState>(
                                          builder: (context, state) =>
                                              state.maybeWhen(
                                                  orElse: () =>
                                                      const CircularProgressIndicator(),
                                                  success: (mapsList) =>
                                                      RoutedPages(
                                                        lisField: listFieled,
                                                        id: id,
                                                        listDonWork:
                                                            listDoneWork,
                                                        mapsList: mapsList,
                                                      ))))))));
                })));
  }
}

//AutoTabRouter
class RoutedPages extends StatefulWidget {
  List<DetailMap> mapsList;
  List<DoneWork> listDonWork;
  List<Field> lisField;
  int id;
  RoutedPages(
      {super.key,
      required this.lisField,
      required this.mapsList,
      required this.id,
      required this.listDonWork});

  @override
  State<RoutedPages> createState() => _RoutedPagesState();
}

class _RoutedPagesState extends State<RoutedPages> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        routes: [
          MapRoute(
              listMaps: widget.mapsList,
              doneWorkList: widget.listDonWork,
              fieldList: widget.lisField),
          TaskRoute(
              id: widget.id,
              listDoneWork: widget.listDonWork,
              listField: widget.lisField),
          const IncidentRoute(),
          const ReportsRoute(),
          const NoticeRoute()
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationbarCustome(tabsRouter: tabsRouter);
        });
  }
}

//BottomNavigationBar
class BottomNavigationbarCustome extends StatelessWidget {
  final TabsRouter tabsRouter;
  const BottomNavigationbarCustome({super.key, required this.tabsRouter});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: tabsRouter.activeIndex,
        onTap: tabsRouter.setActiveIndex,
        unselectedLabelStyle: const TextStyle(color: AppColors.text700),
        selectedLabelStyle: const TextStyle(color: AppColors.primary500),
        backgroundColor: AppColors.backgroundMenuColor,
        unselectedItemColor: AppColors.text700,
        selectedItemColor: AppColors.primary500,
        showUnselectedLabels: true,
        selectedIconTheme: const IconThemeData(color: AppColors.primary500),
        selectedFontSize: 18,
        unselectedIconTheme: const IconThemeData(color: AppColors.text700),
        items: [
          BottomNavigationBarItem(
              icon:
                  svg_('assets/images/svg/home.svg', 0, tabsRouter.activeIndex),
              label: S.of(context).home),
          BottomNavigationBarItem(
              icon:
                  svg_('assets/images/svg/task.svg', 1, tabsRouter.activeIndex),
              label: S.of(context).task),
          BottomNavigationBarItem(
              icon: svg_(
                  'assets/images/svg/incident.svg', 2, tabsRouter.activeIndex),
              label: S.of(context).incident),
          BottomNavigationBarItem(
              icon: svg_(
                  'assets/images/svg/reports.svg', 3, tabsRouter.activeIndex),
              label: S.of(context).reports),
          BottomNavigationBarItem(
              icon: svg_(
                  'assets/images/svg/notice.svg', 4, tabsRouter.activeIndex),
              label: S.of(context).notice),
        ]);
  }
}

Widget svg_(String svgLink, int index, int isIndex) {
  return SvgPicture.asset(
    svgLink,
    color: index == isIndex ? AppColors.primary500 : AppColors.text700,
    height: index == isIndex ? 30 : 20,
  );
}
