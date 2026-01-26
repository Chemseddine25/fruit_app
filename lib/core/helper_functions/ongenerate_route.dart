import 'package:flutter/material.dart';
import 'package:fruit_app/features/auth/presentation/views/login_view.dart';
import 'package:fruit_app/features/auth/presentation/views/singup_view.dart';
import 'package:fruit_app/features/onbording_view/presentaion/views/onbording_view.dart';
import 'package:fruit_app/features/splash_view/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SplashView(),
      );
    case OnbordingView.routeName:
      return MaterialPageRoute(
        builder: (context) => const OnbordingView(),
      );
    case LoginView.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginView(),
      );
    case SingupView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SingupView(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(),
      );
  }
}
      
  
      
    // You can add more routes here in the future
    
 
    
 