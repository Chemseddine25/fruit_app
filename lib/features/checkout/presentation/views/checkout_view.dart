import 'package:flutter/material.dart';
import 'package:fruit_app/core/widgets/custom_app_bar.dart';
import 'package:fruit_app/features/checkout/presentation/domain/enitities/oeder_entity.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruit_app/features/main_view/domain/entities/favorite_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.favorite});
  static const routeName = 'checkout';
  final List<FavoriteEntity> favorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "الشحن", showNotification: false),
      body: Provider.value(
        value: OrderEntity(
          favoriteEntity: favorite,
        ),
        child: const CheckoutViewBody(),
      ),
    );
  }
}
