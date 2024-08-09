import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/generated/l10n.dart';
import 'package:flutter_application_2/src/core/resources/app_colors.dart';
import 'package:flutter_application_2/src/core/resources/app_style.dart';
import 'package:flutter_application_2/src/core/widgets/column_spacer.dart';
import 'package:flutter_application_2/src/feature/app/router/app_router.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/model/done_work/done_work.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/model/field.dart';
import 'package:flutter_application_2/src/feature/task/widget/tab_bar.dart';

@RoutePage()
class TaskPage extends StatefulWidget {
   int? id;
   List<DoneWork>? listDoneWork;
   List<Field>? listField;
   TaskPage({super.key, this.listField,  this.listDoneWork,  this.id});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return 
    AutoTabsRouter.tabBar(
      routes: [
        AllTaskRoute(
            id: widget.id.toString(), listDoneWork: widget.listDoneWork!),
        const MyTaskRoute()
      ],
      builder: (context, child, controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.appBarBackgoundColor,
            title: Text(
              S.of(context).appBarTaskTitle,
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
                  tabs: [
                    Tab(child: TabBarItem(text: S.of(context).all)),
                    Tab(child: TabBarItem(text: S.of(context).myTask)),
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
