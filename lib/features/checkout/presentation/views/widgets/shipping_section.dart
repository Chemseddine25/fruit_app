import 'package:flutter/material.dart';
import 'package:fruit_app/features/checkout/presentation/domain/enitities/oeder_entity.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/shipinig_view.dart';
import 'package:provider/provider.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({
    super.key,
  });

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 33,
        ),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: context.read<OrderEntity>().totalPrice.toString(),
          isSelected: selectedIndex == 0,
        ),
        const SizedBox(height: 16),
        ShippingItem(
          title: ' الدفع اونلاين',
          subTitle: 'يرجي تحديد طريقه الدفع',
          price: '40',
          isSelected: selectedIndex == 1,
          onTap: () {
            setState(
              () {
                selectedIndex = 1;
              },
            );
          },
        ),
      ],
    );
  }
}
