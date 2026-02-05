import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_color.dart';
import 'package:fruit_app/core/widgets/custom_boutton.dart';
import 'package:fruit_app/features/auth/presentation/views/login_view.dart';
import 'package:fruit_app/features/onbording_view/presentaion/views/widgets/onbording_page_view.dart';

import '../../../../../core/services/share_perfences.dart';

class OnbordingViewBody extends StatefulWidget {
  const OnbordingViewBody({super.key});

  @override
  State<OnbordingViewBody> createState() => _OnbordingViewBodyState();
}

class _OnbordingViewBodyState extends State<OnbordingViewBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      OnbordingPageView(
        pageController: pageController,
      ),
      DotsIndicator(
        dotsCount: 2,
        decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: currentPage == 1
                ? AppColors.primaryColor
                : AppColors.primaryColor.withOpacity(0.3)),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Visibility(
          visible: currentPage == 1 ? true : false,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: CustomButton(
            onPressed: () {
              Prefs.setBool('onbording', true);
              Navigator.pushReplacementNamed(context, LoginView.routeName);
            },
            text: 'ابدأ الآن',
          ),
        ),
      ),
    ]);
  }
}
