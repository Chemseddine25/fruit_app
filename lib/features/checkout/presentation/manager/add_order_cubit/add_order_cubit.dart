import 'package:bloc/bloc.dart';
import 'package:fruit_app/core/repos/order_repo/order_repo.dart';
import 'package:fruit_app/features/checkout/presentation/domain/enitities/order_entities/order_input_entity.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.orderRepo) : super(AddOrderInitial());
  final OrderRepo orderRepo;

  Future<void> addOrder({required OrderInputEntity orderInput}) async {
    emit(AddOrderLoading());
    var result = await orderRepo.addOrder(orderInput: orderInput);

    result.fold((l) {
      emit(AddOrderFailure(errmessage: l.message));
    }, (r) {
      emit(AddOrderSuccess());
    });
  }
}
