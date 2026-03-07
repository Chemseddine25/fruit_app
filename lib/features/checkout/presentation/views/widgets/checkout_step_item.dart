import 'package:flutter/material.dart';
import 'package:fruit_app/core/helper_functions/show_error_bar.dart';
import 'package:fruit_app/features/checkout/data/models/oreder_model.dart';
import 'package:fruit_app/features/checkout/presentation/domain/enitities/order_entities/order_input_entity.dart';
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
                final checkout = context.read<CheckoutProvider>();
                final order = context.read<OrderInputEntity>();
                if (index < currentPageIndex) {
                  controller.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                  return; // نخرج من الدالة ولا نكمل بقية الشروط
                }
                if (index == 1) {
                  if (order.isPaid != null) {
                    controller.animateToPage(index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  } else {
                    showBar(context, message: "يرجى تحديد طريقة الدفع أولاً");
                  }
                } else if (index == 2) {
                  bool isValid = checkout.saveAddress();
                  if (isValid) {
                    order.shippingAddress = checkout.shippingAdress;
                    controller.animateToPage(index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  } else {}
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
