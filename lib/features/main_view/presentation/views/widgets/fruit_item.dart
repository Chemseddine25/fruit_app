import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/entities/product_entity.dart';
import 'package:fruit_app/core/utils/app_color.dart';
import 'package:fruit_app/core/utils/test_style.dart';
import 'package:fruit_app/core/widgets/custom_network_image.dart';
import 'package:fruit_app/features/main_view/presentation/cubits/cubit/favorite_cubit.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({required this.products, super.key});
  final ProductEntity products;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF3F5F7),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.favorite_border)),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  products.urlImageProduct != null
                      ? Flexible(
                          child: CustomNetworkImage(
                            imageUrl: products.urlImageProduct,
                            height: 120,
                          ),
                        )
                      : Container(
                          color: Colors.grey,
                          height: 100,
                          width: 100,
                        ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    products.nameProduct.toString(),
                    textAlign: TextAlign.right,
                    style: TextStyles.semiBold16,
                  ),
                  Row(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: products.priceProduct.toString(),
                              style: TextStyles.bold13.copyWith(
                                color: AppColors.secondaryColor,
                              ),
                            ),
                            TextSpan(
                              text: 'دج',
                              style: TextStyles.bold13.copyWith(
                                color: AppColors.secondaryColor,
                              ),
                            ),
                            TextSpan(
                              text: '/',
                              style: TextStyles.bold13.copyWith(
                                color: AppColors.lightSecondaryColor,
                              ),
                            ),
                            TextSpan(
                              text: ' كيلو',
                              style: TextStyles.semiBold13.copyWith(
                                color: AppColors.lightSecondaryColor,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.right,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          context
                              .read<FavoriteCubit>()
                              .addToFavorite(products.productId.toString());
                        },
                        child: const CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ]),
              ),
            ),
          ],
        ));
  }
}
