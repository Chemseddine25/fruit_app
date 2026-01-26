import 'package:flutter/material.dart';
import 'package:fruit_app/constante.dart';
import 'package:fruit_app/core/widgets/custom_boutton.dart';
import 'package:fruit_app/core/widgets/custom_textfieldform.dart';
import 'package:fruit_app/core/widgets/have_an_account_widget.dart';
import 'package:fruit_app/features/auth/presentation/views/widgts/terms_and_condition.dart';

class SingupViewBody extends StatelessWidget {
  const SingupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CustomTextFormField(
              hintText: 'الاسم الكامل',
              textInputType: TextInputType.name,
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              textInputType: TextInputType.emailAddress,
              hintText: 'البريد الإلكتروني',
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              suffixIcon: Icon(Icons.visibility_off),
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 16),
            const TermsAndConditionsWidget(),
            const SizedBox(height: 30),
            CustomButton(
              onPressed: () {},
              text: 'إنشاء حساب',
            ),
            const SizedBox(height: 16),
            const HaveAnAccountWidget(),
          ],
        ),
      ),
    );
  }
}
