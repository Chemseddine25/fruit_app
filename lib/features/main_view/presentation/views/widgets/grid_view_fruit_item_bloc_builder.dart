import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fruit_app/core/helper_functions/get_dummy_product.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/cubit/product_cubit/product_cubit_cubit.dart';
import 'package:fruit_app/features/main_view/presentation/views/widgets/grid_view_fruit_item.dart';

class GridViewFruitItemBlocBuilder extends StatelessWidget {
  const GridViewFruitItemBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return GridViewFruitItem(
            products: state.products,
          );
        } else if (state is ProductFailure) {
          log("The error is: ${state.errmessage}");
          return SliverToBoxAdapter(child: Text(state.errmessage));
        }

        return Skeletonizer.sliver(
            enabled: true,
            child: GridViewFruitItem(
              products: getDummyProducts(),
            ));
      },
    );
  }
}
