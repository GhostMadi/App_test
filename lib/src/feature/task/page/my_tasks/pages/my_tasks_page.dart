import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/core/dependencies/injection_container.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/company_id_logic/bloc/fetch_id_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/company_id_logic/repository/company_id_repository.dart';
import 'package:flutter_application_2/src/feature/task/page/my_tasks/widget/item_task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MyTasksPage extends StatefulWidget {
  const MyTasksPage({super.key});

  @override
  State<MyTasksPage> createState() => _MyTasksPageState();
}

class _MyTasksPageState extends State<MyTasksPage> {
  late FetchIdBloc fetchIdBloc;
  @override
  void initState() {
    super.initState();
    fetchIdBloc = FetchIdBloc(companyIdRepository: sl<CompanyIdRepository>())
      ..add(FetchIds());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: fetchIdBloc,
      child: BlocConsumer<FetchIdBloc, FetchIdState>(
        listener: (context, state) {
          if (state is FetchIdsFailed) {
            log('failed fetch ids.');
            log(state.e.toString());
          } else if (state is FetchIdsSuccess) {
            log('success fetch ids.');
          } else if (state is FetchIdsLoading) {
            log('loading fetch ids.');
          }
        },
        builder: (context, state) {
          if (state is FetchIdsFailed) {
            return const Center(child: Text('system error.'));
          } else if (state is FetchIdsSuccess) {
            log(state.ids[1].id.toString());
            return TasksWidget(id: state.ids[1].id.toString());
          } else if (state is FetchIdsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('system error.'));
          }
        },
      ),
    );
  }
}
