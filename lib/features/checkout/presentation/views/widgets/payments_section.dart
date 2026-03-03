import 'package:flutter/material.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/order_summry_widget.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/shipping_address_widget.dart';

class PaymentsSection extends StatelessWidget {
  const PaymentsSection({super.key, required this.pageController});

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const OrderSummryWidget(),
      const SizedBox(
        height: 16,
      ),
      ShippingAddressWidget(pageController: pageController),
    ]);
  }
}
