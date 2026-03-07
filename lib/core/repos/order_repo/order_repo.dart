import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/errors/failures.dart';
import 'package:fruit_app/features/checkout/presentation/domain/enitities/order_entities/order_input_entity.dart';

abstract class OrderRepo {
  Future<Either<Failure, void>> addOrder(
      {required OrderInputEntity orderInput});
}
