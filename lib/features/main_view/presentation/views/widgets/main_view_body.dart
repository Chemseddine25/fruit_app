import 'package:flutter/material.dart';
import 'package:fruit_app/features/main_view/presentation/views/cart_view.dart';
import 'package:fruit_app/features/main_view/presentation/views/porduct_view.dart';
import 'package:fruit_app/features/main_view/presentation/views/widgets/home_view_.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({required this.currentViewIndex, super.key});
  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: const [
        HomeView(),
        ProductsView(),
        CartView(),
      ],
    );
  }
}
