import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/core/dependencies/injection_container.dart';
import 'package:flutter_application_2/src/core/resources/app_colors.dart';
import 'package:flutter_application_2/src/core/resources/app_style.dart';
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

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackgoundColor,
        title: Text(
          'Home ',
          style: AppStyle.headingH118SemiBold,
        ),
      ),
      body: Column(
        children: [
          HomePageProviders(
            idCompany: widget.id.toString(),
            child: GestureDetector(
                onTap: () {
                  context.pushRoute(MapRoute(
                      doneWorkList: doneWorkList, fieldList: listField));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(child: Text('Map')),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

late DoneWorkBloc doneWorkBloc;
late FieldBloc fieldBloc;
List<DoneWork> doneWorkList = [];
List<Field> listField = [];

///BlocListener and BlocProviders for
class HomePageProviders extends StatefulWidget {
  final String idCompany;
  final Widget child;
  const HomePageProviders(
      {super.key, required this.idCompany, required this.child});

  @override
  State<HomePageProviders> createState() => _HomePageProvidersState();
}

class _HomePageProvidersState extends State<HomePageProviders> {
  @override
  void initState() {
    super.initState();
    fieldBloc = FieldBloc(fieldRepository: sl<FieldRepository>())
      ..add(FieldFetch(id: widget.idCompany));
    doneWorkBloc = DoneWorkBloc(doneWorkRepository: sl<DoneWorkRepository>())
      ..add(DoneWorkFetch(id: widget.idCompany));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: doneWorkBloc),
        BlocProvider.value(value: fieldBloc)
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<DoneWorkBloc, DoneWorkState>(
            listener: (context, state) {
              if (state is DoneWorkFailed) {
                log(state.e.message);
              } else if (state is DoneWorkSuccess) {
                setState(() {
                  doneWorkList = state.doneWorks;
                });
              }
            },
          ),
          BlocListener<FieldBloc, FieldState>(
            listener: (context, state) {
              if (state is FieldFailed) {
                log(state.e.message);
              } else if (state is FieldSuccess) {
                setState(() {
                  listField = state.listField;
                });
              }
            },
          ),
        ],
        child: widget.child,
      ),
    );
  }
}
