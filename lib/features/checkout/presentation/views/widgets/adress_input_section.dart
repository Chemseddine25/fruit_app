import 'package:flutter/material.dart';
import 'package:fruit_app/core/widgets/custom_textfieldform.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          CustomTextFormField(
              hintText: " الاسم الكامل", textInputType: TextInputType.name),
          SizedBox(
            height: 16,
          ),
          CustomTextFormField(
              hintText: "رقم الجوال", textInputType: TextInputType.phone),
          SizedBox(
            height: 16,
          ),
          CustomTextFormField(
              hintText: "الايميل", textInputType: TextInputType.emailAddress),
          SizedBox(
            height: 16,
          ),
          CustomTextFormField(
              hintText: "المدينة", textInputType: TextInputType.streetAddress),
          SizedBox(
            height: 16,
          ),
          CustomTextFormField(
              hintText: "العنوان", textInputType: TextInputType.streetAddress),
        ],
      ),
    );
  }
}
