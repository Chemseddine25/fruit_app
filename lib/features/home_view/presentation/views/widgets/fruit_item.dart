import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_color.dart';
import 'package:fruit_app/core/utils/app_image.dart';
import 'package:fruit_app/core/utils/test_style.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                          child:
                              Image.asset(Assets.assetsImagesWatermelonTest)),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        'مانجو',
                        textAlign: TextAlign.right,
                        style: TextStyles.semiBold16,
                      ),
                      Row(
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '20 ',
                                  style: TextStyles.bold13.copyWith(
                                    color: AppColors.secondaryColor,
                                  ),
                                ),
                                TextSpan(
                                  text: 'جنية ',
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
                          const CircleAvatar(
                            backgroundColor: AppColors.primaryColor,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
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
