import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/entities/product_entity.dart';
import 'package:fruit_app/core/errors/failures.dart';
import 'package:fruit_app/core/models/products_model.dart';
import 'package:fruit_app/core/repos/product_repos/product_repos.dart';
import 'package:fruit_app/core/services/database_service.dart';
import 'package:fruit_app/core/utils/back_end.dart';

class ProductsRepoImpl extends ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, List<ProductEntity>>> bestSellingProducts() async {
    try {
      var data = await databaseService
          .getData(path: BackendEndpoint.getProducts, filter: {
        'limit': 10,
        'orderBy': 'sellingCount',
        'descending': true,
      }) as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return Right(products);
    } catch (e, st) {
      // <-- استثناء + StackTrace
      // أطبع الاستثناء الحقيقي
      log("Error in getProducts: $e");
      log("StackTrace: $st");
      return Left(ServerFailure("Failed to get products: $e"));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoint.getProducts) as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();

      return Right(products);
    } catch (e) {
      log("Full Error Detail: $e"); // هذا سيظهر لك السبب الحقيقي في الـ Console
      return Left(ServerFailure(e.toString())); // إرسال الخطأ الحقيقي للواجهة
    }
  }
}
