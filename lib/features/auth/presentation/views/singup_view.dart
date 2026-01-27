// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:fruit_app/core/services/git_it_service.dart';
import 'package:fruit_app/core/widgets/custom_appbar.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_app/features/auth/presentation/cubits/cubit/sing_up_cubit.dart';
import 'package:fruit_app/features/auth/presentation/views/widgts/singup_bloc_consumer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingupView extends StatelessWidget {
  const SingupView({super.key});
  static const String routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingUpCubit(
        authRepo: getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppbar(context, title: 'إنشاء حساب'),
        body: const SingupViewBodyBlocConsumer(),
      ),
    );
  }
}
