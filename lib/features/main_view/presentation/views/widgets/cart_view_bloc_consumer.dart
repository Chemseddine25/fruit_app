import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/features/main_view/presentation/cubits/cubit/favorite_cubit.dart';
import 'package:fruit_app/features/main_view/presentation/views/widgets/cart_view_body.dart';

class CartViewBodyBlocconsumer extends StatelessWidget {
  const CartViewBodyBlocconsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      buildWhen: (previous, current) {
        // نحدد الحالات التي تستوجب إعادة بناء الواجهة
        return current is FavoriteSuccess ||
            current is FavoriteLoading ||
            current is FavoriteFailure;
      },
      listenWhen: (previous, current) {
        return current is FavoriteRemovedSuccessfully ||
            current is FavoriteAddedSuccessfully;
      },
      listener: (context, state) {
        if (state is FavoriteRemovedSuccessfully) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم حذف المنتج من المفضلة بنجاح'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      builder: (context, state) {
        // 1. التعامل مع حالة النجاح
        if (state is FavoriteSuccess) {
          return CartViewBody(favorites: state.favorites);
        }

        // 2. التعامل مع حالة التحميل (Loading)
        if (state is FavoriteLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is FavoriteFailure) {
          return Center(child: Text(state.message));
        }

        return const Center(child: Text('ابدأ بإضافة منتجاتك المفضلة!'));
      },
    );
  }
}
