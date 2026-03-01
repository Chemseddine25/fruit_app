import 'package:flutter/material.dart';
import 'package:fruit_app/core/helper_functions/calculte_total_price.dart';
import 'package:fruit_app/core/widgets/custom_app_bar.dart';
import 'package:fruit_app/core/widgets/custom_boutton.dart';
import 'package:fruit_app/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruit_app/features/main_view/domain/entities/favorite_entity.dart';
import 'package:fruit_app/features/main_view/presentation/views/widgets/cart_header.dart';
import 'package:fruit_app/features/main_view/presentation/views/widgets/cart_item_list.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key, required this.favorites});
  final List<FavoriteEntity> favorites;

  @override
  Widget build(BuildContext context) {
    final bool isEmpty = favorites.isEmpty;
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  buildAppBar(context,
                      title: "السلة",
                      showBackButton: false,
                      showNotification: false),
                  const SizedBox(
                    height: 20,
                  ),
                  CartHeader(
                    favoritelength: favorites.length,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            if (!isEmpty)
              const SliverToBoxAdapter(
                child: CustomDivider(),
              ),
            favorites.isEmpty
                ? SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart_outlined,
                            size: 64, color: Colors.grey.withOpacity(0.5)),
                        const SizedBox(height: 16),
                        const Text('سلتك فارغة، أضف بعض الفواكه!',
                            style: TextStyle(color: Colors.grey, fontSize: 16)),
                      ],
                    ),
                  )
                : CartItemList(favoriteList: favorites),
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
          ],
        ),
        Positioned(
          bottom: MediaQuery.sizeOf(context).height * 0.1,
          left: 16,
          right: 16,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(
                  scale: animation,
                  child: FadeTransition(opacity: animation, child: child));
            },
            child: !isEmpty
                ? CustomButton(
                    onPressed: () {
                      Navigator.pushNamed(context, CheckoutView.routeName);
                    },
                    text:
                        'الدفع ${calculateTotalPrice(favorites).toString()} دج')
                : const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
