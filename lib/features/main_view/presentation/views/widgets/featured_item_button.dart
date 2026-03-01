import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_color.dart';
import 'package:fruit_app/core/utils/test_style.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              4,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: FittedBox(
            child: Text(
              'تسوق الان',
              style: TextStyles.bold13.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
