import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/constante.dart';
import 'package:fruit_app/core/helper_functions/show_error_bar.dart';
import 'package:fruit_app/core/widgets/custom_boutton.dart';
import 'package:fruit_app/core/widgets/custom_textfieldform.dart';
import 'package:fruit_app/core/widgets/have_an_account_widget.dart';
import 'package:fruit_app/core/widgets/password_formfiled.dart';
import 'package:fruit_app/features/auth/presentation/cubits/cubit/sing_up_cubit.dart';
import 'package:fruit_app/features/auth/presentation/views/widgts/terms_and_condition.dart';

class SingupViewBody extends StatefulWidget {
  const SingupViewBody({super.key});

  @override
  State<SingupViewBody> createState() => _SingupViewBodyState();
}

class _SingupViewBodyState extends State<SingupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, name, password;
  late bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                  print(name);
                },
                hintText: 'الاسم الكامل',
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                textInputType: TextInputType.emailAddress,
                hintText: 'البريد الإلكتروني',
              ),
              const SizedBox(height: 16),
              CustomPasswordFormField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 16),
              TermsAndConditionsWidget(
                onChanged: (value) {
                  isTermsAccepted = value;
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAccepted) {
                      context.read<SingUpCubit>().singUpUser(
                            name: name,
                            email: email,
                            password: password,
                          );
                    } else {
                      showBar(
                        context,
                        'يجب الموافقة على الشروط والأحكام لإنشاء حساب',
                      );
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'إنشاء حساب',
              ),
              const SizedBox(height: 16),
              const HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
