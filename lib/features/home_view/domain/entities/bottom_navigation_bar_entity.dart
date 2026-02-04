import 'package:fruit_app/core/utils/app_image.dart';

class BottomNavigationBarEntity {
  final String activeIcon, inActiveIcon, name;

  BottomNavigationBarEntity({
    required this.activeIcon,
    required this.inActiveIcon,
    required this.name,
  });
}

List<BottomNavigationBarEntity> get navigationBarItems => [
      BottomNavigationBarEntity(
          name: 'الرئيسية',
          activeIcon: Assets.assetsImagesNavigationBarBoldHome,
          inActiveIcon: Assets.assetsImagesNavigationBarOutlineHome),
      BottomNavigationBarEntity(
          name: 'المنتجات',
          activeIcon: Assets.assetsImagesNavigationBarBoldProducts,
          inActiveIcon: Assets.assetsImagesNavigationBarOutlineProducts),
      BottomNavigationBarEntity(
          name: 'العربة',
          activeIcon: Assets.assetsImagesNavigationBarBoldShoppingCart,
          inActiveIcon: Assets.assetsImagesNavigationBarOutlineShoppingCart),
      BottomNavigationBarEntity(
          name: 'حسابي',
          activeIcon: Assets.assetsImagesNavigationBarBoldUser,
          inActiveIcon: Assets.assetsImagesNavigationBarOutlineUser),
    ];
