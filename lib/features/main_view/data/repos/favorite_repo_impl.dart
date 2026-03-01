import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/errors/failures.dart';
import 'package:fruit_app/core/services/database_service.dart';
import 'package:fruit_app/core/utils/back_end.dart';
import 'package:fruit_app/features/main_view/data/models/favorite_model.dart';
import 'package:fruit_app/features/main_view/domain/entities/favorite_entity.dart';
import 'package:fruit_app/features/main_view/domain/repos/favorite_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavoriteRepoImpl extends FavoriteRepo {
  final DatabaseService databaseService;

  FavoriteRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, bool>> addToFavorite(String productId) async {
    final userId = Supabase.instance.client.auth.currentUser!.id;
    try {
      final data = await databaseService.getData(
        path: BackendEndpoint.favorite,
        id: userId,
        queryName: "user_id",
      );
      if (data != null) {
        print("this is data $data");
        final List<dynamic> favorites = data as List;
        bool isFavorite = favorites.any((element) =>
            element["product_id"].toString() == productId.toString());
        if (isFavorite) {
          return const Right(false);
        }
      }

      await databaseService.addData(
        BackendEndpoint.favorite,
        {
          'user_id': userId,
          'product_id': productId,
        },
      );
      return const Right(true);
    } catch (e) {
      log("Error in addToFavorite: $e");
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromFavorite(String favoriteId) async {
    try {
      await databaseService.deleteData(BackendEndpoint.favorite, favoriteId);
      return const Right(null);
    } catch (e) {
      log("Error in addToFavorite: $e");
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<FavoriteEntity>>> getFavorites() async {
    final userId = Supabase.instance.client.auth.currentUser!.id;

    try {
      final data = await databaseService.getData(
        path: BackendEndpoint.favorite,
        id: userId,
        columns: '*, products(*)',
        queryName: "user_id",
      );
      List<FavoriteEntity> favorites = List<Map<String, dynamic>>.from(data)
          .map((e) => FavoriteModel.fromJson(e).toEntity())
          .toList();
      //data.map((e) => FavoriteModel.fromJson(e).toEntity()).toList();
      return Right(favorites);
    } catch (e) {
      log("Full Error Detail: $e"); // هذا سيظهر لك السبب الحقيقي في الـ Console
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateFavoriteQuantity(
      {required String favoriteId, required int quantity}) async {
    try {
      await databaseService.updateData(BackendEndpoint.favorite, favoriteId, {
        'quantity': quantity,
      });
      return const Right(null);
    } catch (e) {
      log("Error in addToFavorite: $e");
      return Left(ServerFailure(e.toString()));
    }
  }
}
