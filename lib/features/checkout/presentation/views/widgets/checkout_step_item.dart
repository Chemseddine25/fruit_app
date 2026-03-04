import 'package:flutter/material.dart';
import 'package:fruit_app/core/helper_functions/show_error_bar.dart';
import 'package:fruit_app/features/checkout/presentation/domain/enitities/oeder_entity.dart';
import 'package:fruit_app/features/checkout/presentation/views/step_items.dart';
import 'package:provider/provider.dart';

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
                if (context.read<OrderEntity>().isPaid != null) {
                  controller.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                } else {
                  showBar(context, message: "يرجي تحديد طريقه الدفع");
                }
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
