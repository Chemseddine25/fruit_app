import 'package:flutter/material.dart';
import 'package:fruit_app/features/auth/presentation/views/login_view.dart';
import 'package:fruit_app/features/auth/presentation/views/singup_view.dart';
import 'package:fruit_app/features/best_selling_fruits/presentation/views/best_selling_view.dart';
import 'package:fruit_app/features/checkout/presentation/domain/enitities/order_entities/odrer_item_entity.dart';
import 'package:fruit_app/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruit_app/features/main_view/presentation/views/main_view.dart';
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
    case MainView.routeName:
      return MaterialPageRoute(
        builder: (context) => const MainView(),
      );
    case BestSellingView.routeName:
      return MaterialPageRoute(
        builder: (context) => const BestSellingView(),
      );

    case CheckoutView.routeName:
      return MaterialPageRoute(
        builder: (context) => CheckoutView(
          order: settings.arguments as List<OrderItemEntity>,
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(),
      );
  }
}
      
  
      
    // You can add more routes here in the future
    
 
    
 