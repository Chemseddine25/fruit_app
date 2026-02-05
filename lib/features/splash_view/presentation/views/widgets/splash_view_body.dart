import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_app/core/services/share_perfences.dart';
import 'package:fruit_app/core/services/supbase_auth_service.dart';
import 'package:fruit_app/core/utils/app_image.dart';
import 'package:fruit_app/features/auth/presentation/views/login_view.dart';
import 'package:fruit_app/features/home_view/presentation/views/home_view.dart';
import 'package:fruit_app/features/onbording_view/presentaion/views/onbording_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigateToOnbordingView();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(Assets.assetsImagesPlant),
            ],
          ),
          SvgPicture.asset(Assets.assetsImagesLogo),
          SvgPicture.asset(Assets.assetsImagesSplashBottom, fit: BoxFit.fill),
        ],
      ),
    );
  }

  void navigateToOnbordingView() {
    Future.delayed(const Duration(seconds: 3), () {
      bool isOnBoardingViewSeen = Prefs.getBool('onbording');
      print(isOnBoardingViewSeen);

      if (isOnBoardingViewSeen) {
        var isLoggedIn = SupbaseAuthService().isUserLoggedIn();

        if (isLoggedIn) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnbordingView.routeName);
      }
    });
  }
}
