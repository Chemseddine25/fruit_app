import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/features/auth/presentation/cubits/cubit/sing_up_cubit.dart';
import 'package:fruit_app/features/auth/presentation/views/widgts/singup_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SingupViewBodyBlocConsumer extends StatelessWidget {
  const SingupViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SingUpCubit, SingUpState>(
      listener: (context, state) {
        if (state is SingUpFailure) {
          print(state.errorMessage);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state is SingUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم إنشاء الحساب بنجاح'),
              backgroundColor: Colors.green,
            ),
          );
        }
        print('yess ');
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SingUpLoading ? true : false,
          child: const SingupViewBody(),
        );
      },
    );
  }
}
