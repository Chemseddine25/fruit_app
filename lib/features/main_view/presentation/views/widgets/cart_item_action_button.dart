import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/utils/app_color.dart';
import 'package:fruit_app/core/utils/test_style.dart';
import 'package:fruit_app/features/main_view/domain/entities/favorite_entity.dart';
import 'package:fruit_app/features/main_view/presentation/cubits/cubit/favorite_cubit.dart';

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton({
    super.key,
    required this.favorites,
  });
  final FavoriteEntity favorites;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ActionButton(
          icon: Icons.add,
          iconColor: Colors.white,
          color: AppColors.primaryColor,
          onPressed: () {
            if (favorites.quanitty < favorites.productEntity.stock) {
              context
                  .read<FavoriteCubit>()
                  .updateFavoriteQuantity(favorites.id, favorites.quanitty + 1);
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            favorites.quanitty.toString(),
            textAlign: TextAlign.center,
            style: TextStyles.bold16,
          ),
        ),
        ActionButton(
          icon: Icons.remove,
          iconColor: Colors.grey,
          color: const Color(0xFFF3F5F7),
          onPressed: () {
            if (favorites.quanitty > 1) {
              context.read<FavoriteCubit>().updateFavoriteQuantity(
                    favorites.id,
                    favorites.quanitty - 1,
                  );
            }
          },
        ),
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton(
      {super.key,
      required this.icon,
      required this.color,
      required this.iconColor,
      required this.onPressed});

  final IconData icon;
  final Color color;
  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 24,
          height: 24,
          padding: const EdgeInsets.all(
            2,
          ),
          decoration: ShapeDecoration(
            color: color,
            shape: const OvalBorder(),
          ),
          child: FittedBox(
              child: Icon(
            icon,
            color: iconColor,
          )),
        ));
  }
}
