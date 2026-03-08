import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/helper_functions/show_error_bar.dart';
import 'package:fruit_app/core/widgets/custom_progress_hud.dart';
import 'package:fruit_app/features/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:fruit_app/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruit_app/features/main_view/presentation/views/cart_view.dart';
import 'package:fruit_app/features/main_view/presentation/views/main_view.dart';
import 'package:fruit_app/features/main_view/presentation/views/porduct_view.dart';
import 'package:fruit_app/features/main_view/presentation/views/widgets/home_view_.dart';

class AddOrderCubitBlocBuilder extends StatelessWidget {
  const AddOrderCubitBlocBuilder({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          showBar(context, message: 'تمت العملية بنجاح');
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pushReplacementNamed(context, MainView.routeName);
          });
        }

        if (state is AddOrderFailure) {
          showBar(context, message: state.errmessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is AddOrderLoading, child: child);
      },
    );
  }
}
