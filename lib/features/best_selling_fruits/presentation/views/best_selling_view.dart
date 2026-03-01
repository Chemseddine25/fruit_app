import 'package:flutter/material.dart';
import 'package:fruit_app/core/widgets/custom_app_bar.dart';

import 'widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = 'best_selling';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "الاكثر مبيعا"),
      body: const BestSellingViewBody(),
    );
  }
}
