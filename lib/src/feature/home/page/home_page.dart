import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/core/dependencies/injection_container.dart';
import 'package:flutter_application_2/src/feature/app/router/app_router.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/bloc/done_work_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/model/done_work/done_work.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/repository/done_work_repository.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/bloc/field_bloc.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/model/field.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/repository/field_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  final int? id;
  const HomePage({super.key, required this.id});

  @override
  State<HomePage> createState() => _HomePageState();
}

late DoneWorkBloc doneWorkBloc;
late FieldBloc fieldBloc;
List<DoneWork> doneWorkList = [];
List<Field> filteredListField = [];

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    fieldBloc = FieldBloc(fieldRepository: sl<FieldRepository>())
      ..add(FieldFetch(id: widget.id.toString()));
    doneWorkBloc = DoneWorkBloc(doneWorkRepository: sl<DoneWorkRepository>());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocProvider.value(
              value: doneWorkBloc..add(DoneWorkFetch(id: widget.id.toString())),
              child: BlocListener<DoneWorkBloc, DoneWorkState>(
                listener: (context, state) {
                  if (state is DoneWorkFailed) {
                    log(state.e.message);
                  } else if (state is DoneWorkSuccess) {
                    setState(() {
                      doneWorkList = state.doneWorks;
                    });
                  }
                },
                child: GestureDetector(
                    onTap: () {
                      context.pushRoute(MapRoute(doneWorkList: doneWorkList));
                    },
                    child: const Text('map')),
              ))
        ],
      ),
    );
  }
}
