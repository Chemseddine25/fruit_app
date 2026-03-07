import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/helper_functions/get_user_data.dart';
import 'package:fruit_app/core/repos/order_repo/order_repo.dart';
import 'package:fruit_app/core/services/git_it_service.dart';
import 'package:fruit_app/core/widgets/custom_app_bar.dart';
import 'package:fruit_app/features/checkout/data/models/oreder_model.dart';
import 'package:fruit_app/features/checkout/presentation/domain/enitities/order_entities/odrer_item_entity.dart';
import 'package:fruit_app/features/checkout/presentation/domain/enitities/order_entities/order_input_entity.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/checkoutview%20bodt.dart';
import 'package:provider/provider.dart';

import '../manager/add_order_cubit/add_order_cubit.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.order});
  static const routeName = 'checkout';
  final List<OrderItemEntity> order;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
            create: (context) => AddOrderCubit(
                  getIt.get<OrderRepo>(),
                )),
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
        body: const AddOrderCubitBlocBuilder(child: CheckoutViewBody()),
      ),
    );
  }
}
