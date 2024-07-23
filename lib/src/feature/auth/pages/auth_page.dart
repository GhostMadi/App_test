import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/core/constatns/app_const.dart';
import 'package:flutter_application_2/src/core/dependencies/injection_container.dart';
import 'package:flutter_application_2/src/core/resources/app_colors.dart';
import 'package:flutter_application_2/src/core/resources/app_style.dart';
import 'package:flutter_application_2/src/core/storage/app_hive_settings.dart';
import 'package:flutter_application_2/src/core/widgets/column_spacer.dart';
import 'package:flutter_application_2/src/core/widgets/custom_button.dart';
import 'package:flutter_application_2/src/core/widgets/custom_text_field.dart';
import 'package:flutter_application_2/src/feature/app/router/app_router.dart';
import 'package:flutter_application_2/src/feature/auth/logic/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_application_2/src/feature/auth/logic/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late AuthBloc authBloc;
  final authKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    authBloc = AuthBloc(authRepository: sl<AuthRepository>());
  }

  bool isAuth = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: authBloc,
      child: Form(
        key: authKey,
        child: Scaffold(
          body: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 51),
                child: Image(image: AssetImage('assets/images/png/logo.png')),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.backgroundLight,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Login',
                      isPrivet: false,
                      validator: (login) {
                        if (!isAuth) {
                          return 'incorrect email';
                        }

                        return null;
                      },
                    ),
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      isPrivet: true,
                      validator: (ps) {
                        if (!isAuth) {
                          return 'incorrect password';
                        }
                        return null;
                      },
                    ),
                    const ColumnSpacer(0.4),
                    Text('Forgot password?', style: AppStyle.textP212Mediumn),
                  ],
                ),
              ),
              const ColumnSpacer(2),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthFailed) {
                    setState(() {
                      isAuth = false;
                    });
                    log(state.toString());
                    log('failed');
                  } else if (state is AuthSuccess) {
                    setState(() {
                      isAuth = true;
                    });
                    AppHiveSettings.saveValue(
                        key: AppConstants.token, value: state.result.access);
                    AppHiveSettings.saveValue(
                        key: AppConstants.refresh, value: state.result.refresh);
                    AppHiveSettings.saveValue(
                        key: AppConstants.timeSaved,
                        value: DateTime.now().toString());
                    context.router.replaceAll([const AppIndexedRoute()]);
                    log('success');
                  }
                },
                builder: (context, state) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: CustomButton(
                        onTap: () {
                          if (authKey.currentState!.validate()) {}
                          context.read<AuthBloc>().add(
                                LogIn(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                ),
                              );
                        },
                        text: state is AuthLoading ? 'Loading' : 'Log in',
                      ));
                },
              ),
              const ColumnSpacer(3.6),
              RichText(
                textAlign: TextAlign.center,
                maxLines: 1,
                softWrap: true,
                text: TextSpan(
                  style: AppStyle.textP212Mediumn
                      .copyWith(color: AppColors.text600),
                  children: [
                    const TextSpan(text: 'Don`t have an account? '),
                    TextSpan(
                      text: ' Geg Started',
                      style: AppStyle.textP212Mediumn.copyWith(
                        color: AppColors.textLinkColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
