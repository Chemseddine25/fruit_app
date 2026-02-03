import 'package:flutter/material.dart';
import 'package:fruit_app/features/home_view/presentation/views/widgets/fruit_item.dart';

class GridViewFruitItem extends StatelessWidget {
  const GridViewFruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 163 / 214,
        ),
        itemBuilder: (context, index) {
          return const FruitItem();
        });
  }
}
