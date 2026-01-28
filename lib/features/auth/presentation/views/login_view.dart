import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/helper_functions/show_error_bar.dart';
import 'package:fruit_app/core/services/git_it_service.dart';
import 'package:fruit_app/core/widgets/custom_appbar.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_app/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:fruit_app/features/auth/presentation/views/widgts/login_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppbar(context, title: 'تسجيل الدخول'),
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              print(state.errorMessage);
              showBar(context, message: state.errorMessage);
            }
            if (state is LoginSuccess) {
              showBar(context, message: 'تم تسجيل الدخول بنجاح');
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: state is LoginLoading ? true : false,
                child: const LoginViewBody());
          },
        ),
      ),
    );
  }
}
