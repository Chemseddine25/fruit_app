import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/widgets/custom_textfieldform.dart';
import 'package:fruit_app/features/checkout/data/models/oreder_model.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CheckoutProvider>();

    return SingleChildScrollView(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: provider.formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            CustomTextFormField(
                controller: provider.nameController,
                hintText: " الاسم الكامل",
                textInputType: TextInputType.name),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
                controller: provider.phoneController,
                hintText: "رقم الجوال",
                textInputType: TextInputType.phone),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
                controller: provider.emailController,
                hintText: "الايميل",
                textInputType: TextInputType.emailAddress),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
                controller: provider.cityController,
                hintText: "المدينة",
                textInputType: TextInputType.streetAddress),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
                controller: provider.addressController,
                hintText: "العنوان",
                textInputType: TextInputType.streetAddress),
          ],
        ),
      ),
    );
  }
}
