import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_app/features/home_view/presentation/views/widgets/custom_navigation_bart_bottom.dart';
import 'package:fruit_app/features/home_view/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'home_view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
