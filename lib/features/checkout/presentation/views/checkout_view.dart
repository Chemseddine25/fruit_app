import 'package:flutter/material.dart';
import 'package:fruit_app/core/helper_functions/get_user_data.dart';
import 'package:fruit_app/core/widgets/custom_app_bar.dart';
import 'package:fruit_app/features/checkout/data/models/oreder_model.dart';
import 'package:fruit_app/features/checkout/presentation/domain/enitities/odrer_item_entity.dart';
import 'package:fruit_app/features/checkout/presentation/domain/enitities/oeder_entity.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.order});
  static const routeName = 'checkout';
  final List<OrderItemEntity> order;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(
          value: OrderInputEntity(
              userId: getUserData().uId,
              items: order,
              totalPrice: OrderInputEntity.calculateFinalPrice(order)),
        ),
        ChangeNotifierProvider(
          create: (context) => CheckoutProvider(),
        ),
      ],
      child: Scaffold(
        appBar: buildAppBar(context, title: "الشحن", showNotification: false),
        body: const CheckoutViewBody(),
      ),
    );
  }
}
