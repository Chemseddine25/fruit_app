import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/errors/failures.dart';
import 'package:fruit_app/core/repos/order_repo/order_repo.dart';
import 'package:fruit_app/core/services/database_service.dart';
import 'package:fruit_app/core/utils/back_end.dart';
import 'package:fruit_app/features/checkout/data/models/orders/oreder_model.dart';
import 'package:fruit_app/features/checkout/presentation/domain/enitities/order_entities/order_input_entity.dart';

class OrderRepoImpl implements OrderRepo {
  final DatabaseService databaseService;

  OrderRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, void>> addOrder(
      {required OrderInputEntity orderInput}) async {
    try {
      var orderModel = OrderModel.fromEntity(orderInput);
      await databaseService.addData(BackendEndpoint.order, orderModel.toJson());

      return const Right(null);
    } catch (e) {
      log("Error in addToFavorite: $e");
      return Left(ServerFailure(e.toString()));
    }
  }
}
