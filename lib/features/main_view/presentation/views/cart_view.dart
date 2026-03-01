import 'package:flutter/material.dart';
import 'package:fruit_app/features/main_view/presentation/views/widgets/cart_view_bloc_consumer.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CartViewBodyBlocconsumer();
  }
}
