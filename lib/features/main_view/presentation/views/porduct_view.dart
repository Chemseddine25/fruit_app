import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/cubit/product_cubit/product_cubit_cubit.dart';
import 'package:fruit_app/core/repos/product_repos/product_repos.dart';
import 'package:fruit_app/core/services/git_it_service.dart';
import 'package:fruit_app/features/main_view/presentation/views/widgets/products_virw_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(
        getIt.get<ProductsRepo>(),
      ),
      child: const ProductsViewBody(),
    );
  }
}
