import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_color.dart';
import 'package:fruit_app/core/utils/app_image.dart';
import 'package:fruit_app/core/utils/test_style.dart';
import 'package:fruit_app/features/onbording_view/presentaion/views/widgets/page_view_item.dart';

class OnbordingPageView extends StatelessWidget {
  const OnbordingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        controller: pageController,
        children: [
          PageViewItem(
              imagebackground: Assets.assetsImagesPageViewItem1BackgroundImage,
              image: Assets.assetsImagesPageViewItem1Image,
              title:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  'مرحبًا بك في',
                  style: TextStyles.bold23,
                ),
                Text(
                  '  HUB',
                  style: TextStyles.bold23.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                Text(
                  'Fruit',
                  style: TextStyles.bold23.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ]),
              subtitle:
                  'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
              isvisible: true),
          const PageViewItem(
            isvisible: false,
            imagebackground: Assets.assetsImagesPageViewItem2BackgroundImage,
            image: Assets.assetsImagesPageViewItem2Image,
            title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'ابحث وتسوق',
                style: TextStyles.bold23,
              ),
            ]),
            subtitle:
                'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          ),
        ],
      ),
    );
  }
}
