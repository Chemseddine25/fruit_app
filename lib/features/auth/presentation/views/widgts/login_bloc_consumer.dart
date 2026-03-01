// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/helper_functions/show_error_bar.dart';
import 'package:fruit_app/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:fruit_app/features/auth/presentation/views/widgts/login_view_body.dart';
import 'package:fruit_app/features/main_view/presentation/views/main_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginBlocConsumer extends StatelessWidget {
  const LoginBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          print(state.errorMessage);
          showBar(context, message: state.errorMessage);
        }
        if (state is LoginSuccess) {
          showBar(context, message: 'تم تسجيل الدخول بنجاح');
          Navigator.of(context).pushReplacementNamed(MainView.routeName);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is LoginLoading ? true : false,
            child: const LoginViewBody());
      },
    );
  }
}
