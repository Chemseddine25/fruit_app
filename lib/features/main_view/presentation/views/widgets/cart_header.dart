import 'package:flutter/material.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key, required this.favoritelength});
  final int favoritelength;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(color: Color(0xFFEBF9F1)),
      child: Center(
        child: Text(
          'لديك  ${favoritelength.toString()} منتجات في سله التسوق',
          style: const TextStyle(
            color: Color(0xFF1B5E37),
            fontSize: 13,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w400,
            height: 0.12,
          ),
        ),
      ),
    );
  }
}
