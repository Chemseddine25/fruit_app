import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/constante.dart';
import 'package:fruit_app/core/cubit/product_cubit/product_cubit_cubit.dart';
import 'package:fruit_app/core/widgets/search_textfield.dart';
import 'package:fruit_app/features/main_view/presentation/views/widgets/best_seller_header.dart';
import 'package:fruit_app/features/main_view/presentation/views/widgets/custom_home_appbar.dart';
import 'package:fruit_app/features/main_view/presentation/views/widgets/featured_list.dart';
import 'package:fruit_app/features/main_view/presentation/views/widgets/grid_view_fruit_item_bloc_builder.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductCubit>().getProducts();

    super.initState();
  }

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
          GridViewFruitItemBlocBuilder(),
        ],
      ),
    );
  }
}
