import 'package:flutter/material.dart';
import 'package:fruit_app/core/widgets/custom_appbar.dart';
import 'package:fruit_app/features/auth/presentation/views/widgts/singup_view_body.dart';

class SingupView extends StatelessWidget {
  const SingupView({super.key});
  static const String routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context, title: 'إنشاء حساب'),
      body: const SingupViewBody(),
    );
  }
}
