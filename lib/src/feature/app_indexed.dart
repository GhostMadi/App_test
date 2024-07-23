import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/core/resources/app_colors.dart';
import 'package:flutter_application_2/src/feature/app/router/app_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class AppIndexedPage extends StatefulWidget {
  const AppIndexedPage({super.key});

  @override
  State<AppIndexedPage> createState() => _AppIndexedPageState();
}

class _AppIndexedPageState extends State<AppIndexedPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        TaskRoute(),
        IncidentRoute(),
        ReportsRoute(),
        NoticeRoute()
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
            unselectedLabelStyle: const TextStyle(color: AppColors.text700),
            selectedLabelStyle: const TextStyle(color: AppColors.primary500),
            backgroundColor: AppColors.backgroundMenuColor,
            unselectedItemColor: AppColors.text700,
            selectedItemColor: AppColors.primary500,
            showUnselectedLabels: true,
            selectedIconTheme: const IconThemeData(color: AppColors.primary500),
            unselectedIconTheme: const IconThemeData(color: AppColors.text700),
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/images/svg/home.svg'),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/images/svg/task.svg'),
                  label: 'Task'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/images/svg/incident.svg'),
                  label: 'Incident'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/images/svg/reports.svg'),
                  label: 'Reports'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/images/svg/notice.svg'),
                  label: 'Notice'),
            ],
          ),
        );
      },
    );
  }
}
