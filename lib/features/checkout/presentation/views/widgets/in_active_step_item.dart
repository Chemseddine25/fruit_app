import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/test_style.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({
    super.key,
    required this.title,
    required this.stepNumber,
  });
  final String title;
  final String stepNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: const Color(0xFFF2F3F3),
          child: Text(
            stepNumber,
            style: TextStyles.semiBold13,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          title,
          style: TextStyles.semiBold13.copyWith(
            color: const Color(0xFFAAAAAA),
          ),
        )
      ],
    );
  }
}
