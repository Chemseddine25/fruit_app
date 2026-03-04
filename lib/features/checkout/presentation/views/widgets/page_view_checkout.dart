import 'package:flutter/material.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/adress_input_section.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/payments_section.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/shipping_section.dart';

class CheckoutPageView extends StatelessWidget {
  const CheckoutPageView({
    super.key,
    required this.controller,
  });
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        itemCount: getpages().length,
        itemBuilder: (context, index) {
          return getpages()[index];
        });
  }

  List<Widget> getpages() {
    return [
      ShippingSection(),
      const AddressInputSection(),
      PaymentsSection(
        pageController: controller,
      ),
    ];
  }
}
