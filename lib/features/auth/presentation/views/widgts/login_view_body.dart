import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_color.dart';
import 'package:fruit_app/core/utils/app_image.dart';
import 'package:fruit_app/core/utils/test_style.dart';
import 'package:fruit_app/core/widgets/custom_boutton.dart';
import 'package:fruit_app/core/widgets/custom_textfieldform.dart';
import 'package:fruit_app/core/widgets/dont_have_account_widget.dart';
import 'package:fruit_app/features/auth/presentation/views/widgts/or_divider.dart';
import 'package:fruit_app/features/auth/presentation/views/widgts/social_media_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CustomTextFormField(
              hintText: 'البريد الإلكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              suffixIcon: Icon(Icons.visibility_off),
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'نسيت كلمة المرور؟',
                  style: TextStyles.bold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 33,
            ),
            CustomButton(onPressed: () {}, text: 'تسجيل الدخول'),
            const SizedBox(
              height: 33,
            ),
            const DontHaveAnAccountWidget(),
            const SizedBox(
              height: 33,
            ),
            const OrDivider(),
            const SizedBox(
              height: 16,
            ),
            SocialLoginButton(
              image: Assets.assetsImagesGoogleIcon,
              onPressed: () {},
              title: ' التسجيل عبر جوجل',
            ),
            const SizedBox(
              height: 16,
            ),
            SocialLoginButton(
              onPressed: () {},
              image: Assets.assetsImagesApplIcon,
              title: 'تسجيل بواسطة أبل',
            ),
            const SizedBox(
              height: 16,
            ),
            SocialLoginButton(
                image: Assets.assetsImagesFacebookIcon,
                title: 'تسجيل بواسطة فيسبوك',
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
