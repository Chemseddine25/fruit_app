import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_app/core/utils/app_color.dart';
import 'package:fruit_app/core/utils/app_image.dart';
import 'package:fruit_app/core/utils/test_style.dart';
import 'package:fruit_app/core/widgets/custom_network_image.dart';
import 'package:fruit_app/features/main_view/domain/entities/favorite_entity.dart';
import 'package:fruit_app/features/main_view/presentation/cubits/cubit/favorite_cubit.dart';
import 'package:fruit_app/features/main_view/presentation/views/widgets/cart_item_action_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.favoriteEntity});
  final FavoriteEntity favoriteEntity;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 92,
            height: 92,
            decoration: const BoxDecoration(
              color: Color(0xFFF3F5F7),
            ),
            child: CustomNetworkImage(
                imageUrl: favoriteEntity.productEntity.urlImageProduct!),
          ),
          const SizedBox(
            width: 17,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      favoriteEntity.productEntity.nameProduct,
                      style: TextStyles.bold13,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        context
                            .read<FavoriteCubit>()
                            .removeFromFavorite(favoriteEntity.id);
                      },
                      child: SvgPicture.asset(Assets.assetsImagesTrash),
                    ),
                  ],
                ),
                Text('${favoriteEntity.quanitty} كم', // الوزن الحقيقي
                    textAlign: TextAlign.right,
                    style: TextStyles.regular13.copyWith(
                      color: AppColors.secondaryColor,
                    )),
                Row(
                  children: [
                    CartItemActionButton(
                      favorites: favoriteEntity,
                    ),
                    const Spacer(),
                    Text(
                      '${favoriteEntity.totalPrice()} دج', // السعر الحقيقي
                      style: TextStyles.bold16
                          .copyWith(color: AppColors.secondaryColor),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
