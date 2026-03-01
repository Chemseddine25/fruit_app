import 'package:flutter/material.dart';
import 'package:fruit_app/core/entities/product_entity.dart';
import 'package:fruit_app/features/main_view/presentation/views/widgets/fruit_item.dart';

class GridViewFruitItem extends StatelessWidget {
  const GridViewFruitItem({required this.products, super.key});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 163 / 214,
        ),
        itemBuilder: (context, index) {
          return FruitItem(products: products[index]);
        });
  }
}
