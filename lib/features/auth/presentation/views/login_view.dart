import 'package:flutter/material.dart';
import 'package:fruit_app/core/widgets/custom_appbar.dart';
import 'package:fruit_app/features/auth/presentation/views/widgts/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context, title: 'تسجيل الدخول'),
      body: const LoginViewBody(),
    );
  }
}
