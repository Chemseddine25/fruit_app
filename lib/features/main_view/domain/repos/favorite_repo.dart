import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/errors/failures.dart';
import 'package:fruit_app/features/main_view/domain/entities/favorite_entity.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, bool>> addToFavorite(String productId);

  Future<Either<Failure, List<FavoriteEntity>>> getFavorites();
  Future<Either<Failure, void>> removeFromFavorite(String favoriteId);

  Future<Either<Failure, void>> updateFavoriteQuantity({
    required String favoriteId,
    required int quantity,
  });
}
