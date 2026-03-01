import 'package:flutter/material.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/step_items.dart';

class CheckoutStepItem extends StatelessWidget {
  const CheckoutStepItem({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(getSteps.length, (index) {
          return StepItem(
              title: getSteps[index],
              stepNumber: (index + 1).toString(),
              isSelected: index == currentIndex);
        }));
  }
}

List<String> getSteps = ['الشحن', 'الدفع', 'تاكيد الطلب', 'تم التوصيل'];
