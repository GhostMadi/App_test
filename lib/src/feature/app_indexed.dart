// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/core/dependencies/injection_container.dart';
import 'package:flutter_application_2/src/core/resources/app_colors.dart';
import 'package:flutter_application_2/src/feature/app/router/app_router.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/company_id_logic/bloc/fetch_id_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/company_id_logic/repository/company_id_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class AppIndexedPage extends StatefulWidget {
  const AppIndexedPage({super.key});

  @override
  State<AppIndexedPage> createState() => _AppIndexedPageState();
}

late FetchIdBloc fetchIdBloc;

class _AppIndexedPageState extends State<AppIndexedPage> {
  @override
  void initState() {
    super.initState();
    fetchIdBloc = FetchIdBloc(companyIdRepository: sl<CompanyIdRepository>());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: fetchIdBloc..add(FetchIds()),
      child: BlocBuilder<FetchIdBloc, FetchIdState>(builder: (context, state) {
        if (state is FetchIdsFailed) {
          return const Center(child: Text('no found ids'));
        } else if (state is FetchIdsSuccess) {
          return AutoTabsRouter(
              routes: [
                HomeRoute(id: state.ids[1].id),
                TaskRoute(id: state.ids[1].id),
                const IncidentRoute(),
                const ReportsRoute(),
                const NoticeRoute()
              ],
              transitionBuilder: (context, child, animation) =>
                  FadeTransition(opacity: animation, child: child),
              builder: (context, child) {
                final tabsRouter = AutoTabsRouter.of(context);
                return Scaffold(
                  body: SafeArea(child: child),
                  bottomNavigationBar: BottomNavigationBar(
                    currentIndex: tabsRouter.activeIndex,
                    onTap: tabsRouter.setActiveIndex,
                    unselectedLabelStyle:
                        const TextStyle(color: AppColors.text700),
                    selectedLabelStyle:
                        const TextStyle(color: AppColors.primary500),
                    backgroundColor: AppColors.backgroundMenuColor,
                    unselectedItemColor: AppColors.text700,
                    selectedItemColor: AppColors.primary500,
                    showUnselectedLabels: true,
                    selectedIconTheme:
                        const IconThemeData(color: AppColors.primary500),
                    selectedFontSize: 18,
                    unselectedIconTheme:
                        const IconThemeData(color: AppColors.text700),
                    items: [
                      BottomNavigationBarItem(
                          icon: svg_('assets/images/svg/home.svg', 0,
                              tabsRouter.activeIndex),
                          label: 'Home'),
                      BottomNavigationBarItem(
                          icon: svg_('assets/images/svg/task.svg', 1,
                              tabsRouter.activeIndex),
                          label: 'Task'),
                      BottomNavigationBarItem(
                          icon: svg_('assets/images/svg/incident.svg', 2,
                              tabsRouter.activeIndex),
                          label: 'Incident'),
                      BottomNavigationBarItem(
                          icon: svg_('assets/images/svg/reports.svg', 3,
                              tabsRouter.activeIndex),
                          label: 'Reports'),
                      BottomNavigationBarItem(
                          icon: svg_('assets/images/svg/notice.svg', 4,
                              tabsRouter.activeIndex),
                          label: 'Notice'),
                    ],
                  ),
                );
              });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}

Widget svg_(String svgLink, int index, int isIndex) {
  return SvgPicture.asset(
    svgLink,
    color: index == isIndex ? AppColors.primary500 : AppColors.text700,
    height: index == isIndex ? 30 : 20,
  );
}
