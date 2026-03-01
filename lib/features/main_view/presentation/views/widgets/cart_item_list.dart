import 'package:flutter/material.dart';
import 'package:fruit_app/features/main_view/domain/entities/favorite_entity.dart';
import 'package:fruit_app/features/main_view/presentation/views/widgets/cart_item.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.favoriteList});
  final List<FavoriteEntity> favoriteList;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => const CustomDivider(),
      itemCount: favoriteList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CartItem(
            favoriteEntity: favoriteList[index],
          ),
        );
      },
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color(0xFFDCDEDE),
    );
  }
}
