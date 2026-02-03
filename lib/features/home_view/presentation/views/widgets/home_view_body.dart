import 'package:flutter/widgets.dart';
import 'package:fruit_app/constante.dart';
import 'package:fruit_app/core/widgets/search_textfield.dart';
import 'package:fruit_app/features/home_view/presentation/views/widgets/custom_home_appbar.dart';
import 'package:fruit_app/features/home_view/presentation/views/widgets/featured_list.dart';
import 'package:fruit_app/features/home_view/presentation/views/widgets/grid_view_fruit_item.dart';
import 'best_seller_header.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Column(
            children: [
              SizedBox(height: kTopPaddding),
              CustomHomeAppBar(),
              SizedBox(height: kTopPaddding),
              SearchTextField(),
              SizedBox(height: 12),
              FeaturedList(),
              SizedBox(height: 12),
              BestSellingHeader(),
              SizedBox(height: 8),
            ],
          )),
          GridViewFruitItem(),
        ],
      ),
    );
  }
}
