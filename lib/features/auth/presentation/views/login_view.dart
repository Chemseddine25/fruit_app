import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/services/git_it_service.dart';
import 'package:fruit_app/core/widgets/custom_appbar.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_app/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:fruit_app/features/auth/presentation/views/widgts/login_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppbar(context, title: 'تسجيل الدخول'),
        body: const LoginBlocConsumer(),
      ),
    );
  }
}
