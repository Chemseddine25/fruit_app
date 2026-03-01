import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_app/core/helper_functions/get_user_data.dart';
import 'package:fruit_app/core/utils/app_image.dart';
import 'package:fruit_app/core/utils/test_style.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: SvgPicture.asset(Assets.assetsImagesNotification),
      leading: Image.asset(Assets.assetsImagesProfileImage),
      title: Text(
        'صباح الخير !..',
        textAlign: TextAlign.right,
        style: TextStyles.regular16.copyWith(
          color: const Color(0xFF949D9E),
        ),
      ),
      subtitle: Text(
        getUserData().name,
        textAlign: TextAlign.right,
        style: TextStyles.bold16,
      ),
    );
  }
}
