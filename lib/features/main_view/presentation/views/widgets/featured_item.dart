import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_app/core/utils/app_image.dart';
import 'package:fruit_app/core/utils/test_style.dart';
import 'package:fruit_app/features/main_view/presentation/views/widgets/featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width - 32;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), // نفس قيمة الـ ClipRRect
          border: Border.all(
            color: const Color(0xFFE2E2E2), // اختر لون الإطار المناسب
            width: 1.5, // سمك الإطار
          ),
        ),
        child: SizedBox(
          width: itemWidth,
          child: AspectRatio(
            aspectRatio: 342 / 158,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  right: itemWidth * .4,
                  child: SvgPicture.asset(
                    Assets.assetsImagesPageViewItem2Image,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: itemWidth * .5,
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        Assets.assetsImagesFeaturedItemBackground,
                        fit: BoxFit.fill,
                        width: itemWidth * .5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 33),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 25),
                            Text(
                              'عروض العيد',
                              style: TextStyles.regular13.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'خصم 25%',
                              style: TextStyles.bold19.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 11),
                            FeaturedItemButton(
                              onPressed: () {},
                            ),
                            const SizedBox(height: 29),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
