import 'package:fruit_app/core/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class FavoriteEntity extends Equatable {
  final String id;
  final String productId;
  final String userId;
  final int quanitty;
  final ProductEntity productEntity;

  const FavoriteEntity({
    required this.quanitty,
    required this.productEntity,
    required this.id,
    required this.productId,
    required this.userId,
  });

  num totalPrice() {
    return quanitty * productEntity.priceProduct;
  }

  @override
  List<Object?> get props => [id, productId, userId, quanitty, productEntity];
}
