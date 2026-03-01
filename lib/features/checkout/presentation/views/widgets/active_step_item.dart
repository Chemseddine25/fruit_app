import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_color.dart';
import 'package:fruit_app/core/utils/test_style.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 11.5,
          backgroundColor: AppColors.primaryColor,
          child: Icon(
            Icons.check,
            size: 18,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          title,
          style: TextStyles.bold13.copyWith(color: AppColors.primaryColor),
        )
      ],
    );
  }
}
