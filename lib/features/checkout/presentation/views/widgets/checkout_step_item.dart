import 'package:flutter/material.dart';
import 'package:fruit_app/features/checkout/presentation/views/step_items.dart';

class CheckoutStepItem extends StatelessWidget {
  const CheckoutStepItem(
      {super.key, required this.currentPageIndex, required this.controller});
  final int currentPageIndex;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(getSteps.length, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                controller.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              },
              child: StepItem(
                title: getSteps[index],
                stepNumber: (index + 1).toString(),
                isSelected: index <= currentPageIndex,
              ),
            ),
          );
        }));
  }
}

List<String> getSteps = [
  'الشحن',
  'تاكيد الطلب',
  'الدفع',
];
