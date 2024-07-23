import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/core/resources/app_colors.dart';
import 'package:flutter_application_2/src/core/resources/app_style.dart';
import 'package:flutter_application_2/src/core/widgets/column_spacer.dart';
import 'package:flutter_application_2/src/feature/app/router/app_router.dart';
import 'package:flutter_application_2/src/feature/task/widget/tab_bar.dart';

@RoutePage()
class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [
        AllRoute(),
        MyTasksRoute(),
      ],
      builder: (context, child, controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.appBarBackgoundColor,
            title: Text(
              'Задачи и работы',
              style: AppStyle.headingH118SemiBold,
            ),
            
          ),
          body: Column(
            children: [
              const ColumnSpacer(2),
              SizedBox(
                height: 30,
                child: TabBar(
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: WidgetStateProperty.resolveWith<Color?>(
                    (Set<WidgetState> states) {
                      return states.contains(WidgetState.focused)
                          ? null
                          : Colors.transparent;
                    },
                  ),
                  controller: controller,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primary100,
                  ),
                  indicatorPadding: const EdgeInsets.only(
                      top: 0, right: 1, bottom: 2, left: 1),
                  dividerHeight: 0,
                  tabs: const [
                    Tab(child: TabBarItem(text: 'все')),
                    Tab(child: TabBarItem(text: 'мои задачи')),
                  ],
                ),
              ),
              const ColumnSpacer(1),
              Expanded(child: child)
            ],
          ),
        );
      },
    );
  }
}
