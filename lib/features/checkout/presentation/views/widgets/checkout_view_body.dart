import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fruit_app/core/helper_functions/show_error_bar.dart';
import 'package:fruit_app/core/services/paypal_service.dart';
import 'package:fruit_app/core/widgets/custom_boutton.dart';
import 'package:fruit_app/features/checkout/data/models/oreder_model.dart';
import 'package:fruit_app/features/checkout/presentation/domain/enitities/order_entities/order_input_entity.dart';
import 'package:fruit_app/features/checkout/presentation/domain/enitities/paypel_entities/paypel_enity.dart';
import 'package:fruit_app/features/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/checkout_step_item.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/page_view_checkout.dart';
import 'package:provider/provider.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({
    super.key,
  });

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  int currentPageIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.round();
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CheckoutStepItem(
            currentPageIndex: currentPageIndex,
            controller: pageController,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: CheckoutPageView(
              controller: pageController,
            ),
          ),
          CustomButton(
              onPressed: () {
                final order = context.read<OrderInputEntity>();
                if (currentPageIndex == 0) {
                  if (context.read<OrderInputEntity>().isPaid != null) {
                    navigatioCheckoutView();
                  } else {
                    showBar(context, message: "يرجي تحديد طريقه الدفع");
                  }
                } else {
                  if (currentPageIndex == 1) {
                    final checkout = context.read<CheckoutProvider>();

                    bool isValid = checkout.saveAddress();

                    if (isValid) {
                      // تحديث الـ OrderEntity بالعنوان الجديد قبل الانتقال
                      order.shippingAddress = checkout.shippingAdress;

                      print(
                          "this is address Name: ${order.shippingAddress?.name}");
                      print(
                          "this is address City: ${order.shippingAddress?.city}");
                      navigatioCheckoutView();
                    } else {}
                  } else if (currentPageIndex == 2) {
                    final paypalPayment = PaypalPaymentEntity.fromEntity(order);
                    PaypalService().payWithPaypal(
                        context: context,
                        paymentEntity: paypalPayment,
                        onSuccess: (Map params) async {
                          print("yes");
                          log("this order: $paypalPayment");
                        },
                        onCancel: () {
                          print("cancel");
                        },
                        onError: (error) {
                          Navigator.pop(context);
                          log(error.toString());
                          showBar(context, message: 'حدث خطأ في عملية الدفع');
                        });
                    //context.read<AddOrderCubit>().addOrder(orderInput: order);
                  }
                }
              },
              text: 'مرحلة: ${getSteps[currentPageIndex]}'),
        ],
      ),
    );
  }

  void navigatioCheckoutView() {
    pageController.animateToPage(currentPageIndex + 1,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}
