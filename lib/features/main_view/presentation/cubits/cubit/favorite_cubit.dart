import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_app/features/main_view/domain/entities/favorite_entity.dart';
import 'package:fruit_app/features/main_view/domain/repos/favorite_repo.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoriteRepo) : super(FavoriteInitial());
  final FavoriteRepo favoriteRepo;

  Future<void> addToFavorite(String productId) async {
    var result = await favoriteRepo.addToFavorite(productId);
    result.fold((l) {
      print('Error Detail: ${l.message}');
      emit(FavoriteFailure(message: l.message));
    }, (isAdded) async {
      emit(FavoriteAddedSuccessfully());
      await getFavorites();
    });
  }

  Future<void> getFavorites() async {
    var result = await favoriteRepo.getFavorites();
    result.fold((l) {
      print('Error Detail: ${l.message}');
      emit(FavoriteFailure(message: l.message));
    }, (r) {
      emit(FavoriteSuccess(favorites: r));
    });
  }

  Future<void> removeFromFavorite(String favoriteId) async {
    if (state is FavoriteSuccess) {
      final List<FavoriteEntity> oldfavorite =
          (state as FavoriteSuccess).favorites;

      final List<FavoriteEntity> newfavorite =
          oldfavorite.where((element) => element.id != favoriteId).toList();

      emit(FavoriteSuccess(favorites: newfavorite));
      final result = await favoriteRepo.removeFromFavorite(favoriteId);

      result.fold((l) {
        emit(FavoriteSuccess(favorites: oldfavorite));
        print('Error Detail: ${l.message}');
        emit(FavoriteFailure(message: l.message));
      }, (r) async {
        emit(FavoriteRemovedSuccessfully());
        emit(FavoriteSuccess(favorites: newfavorite));
      });
    }
  }

  Future<void> updateFavoriteQuantity(String favoriteId, int quantity) async {
    if (state is FavoriteSuccess) {
      final List<FavoriteEntity> oldfavorite =
          (state as FavoriteSuccess).favorites;

      final List<FavoriteEntity> updatedList = oldfavorite.map((element) {
        if (element.id == favoriteId) {
          return FavoriteEntity(
              quanitty: quantity,
              productEntity: element.productEntity,
              id: element.id,
              productId: element.productId,
              userId: element.userId);
        }
        return element;
      }).toList();
      emit(FavoriteSuccess(favorites: updatedList));

      var result = await favoriteRepo.updateFavoriteQuantity(
        favoriteId: favoriteId,
        quantity: quantity,
      );

      result.fold((l) {
        emit(FavoriteSuccess(favorites: oldfavorite));
        print('Error Detail: ${l.message}');
        emit(FavoriteFailure(message: l.message));
      }, (r) async {});
    }
  }
}
