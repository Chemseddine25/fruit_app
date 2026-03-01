part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object?> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteSuccess extends FavoriteState {
  final List<FavoriteEntity> favorites;

  const FavoriteSuccess({required this.favorites});
  @override
  List<Object?> get props => [favorites];
}

final class FavoriteAddedSuccessfully extends FavoriteState {}

final class FavoriteRemovedSuccessfully extends FavoriteState {}

final class FavoriteFailure extends FavoriteState {
  final String message;

  const FavoriteFailure({required this.message});
}
