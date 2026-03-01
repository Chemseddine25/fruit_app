import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/constante.dart';
import 'package:fruit_app/core/cubit/product_cubit/product_cubit_cubit.dart';
import 'package:fruit_app/core/widgets/custom_app_bar.dart';
import 'package:fruit_app/core/widgets/search_textfield.dart';
// ignore: unused_import
import 'package:fruit_app/features/main_view/presentation/views/widgets/best_seller_header.dart';
import 'package:fruit_app/features/main_view/presentation/views/widgets/grid_view_fruit_item_bloc_builder.dart';
import 'package:fruit_app/features/main_view/presentation/views/widgets/products_view_header.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Column(
            children: [
              const SizedBox(height: kTopPaddding),
              buildAppBar(
                context,
                title: 'المنتجات',
                showBackButton: false,
              ),
              const SizedBox(height: kTopPaddding),
              const SearchTextField(),
              const SizedBox(height: 12),
              ProductsViewHeader(
                productsLength: context.read<ProductCubit>().productslength,
              ),
              const SizedBox(height: 8),
            ],
          )),
          const GridViewFruitItemBlocBuilder(),
        ],
      ),
    );
  }
}
