import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/test_style.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'الاكثر مبيعاً',
          textAlign: TextAlign.right,
          style: TextStyles.bold16,
        ),
        const Spacer(),
        Text('عرض الكل',
            textAlign: TextAlign.center,
            style: TextStyles.regular13.copyWith(
              color: const Color(0xFF949D9E),
            )),
      ],
    );
  }
}
