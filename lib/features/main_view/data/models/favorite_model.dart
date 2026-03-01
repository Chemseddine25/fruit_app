import 'package:fruit_app/core/models/products_model.dart';
import 'package:fruit_app/features/main_view/domain/entities/favorite_entity.dart';

class FavoriteModel {
  final String id;
  final String productId;
  final String userId;
  final int quantity;
  final ProductModel product;

  FavoriteModel({
    required this.id,
    required this.productId,
    required this.userId,
    required this.quantity,
    required this.product,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'].toString(),
      productId: json['product_id'].toString(),
      userId: json['user_id'],
      quantity: json['quantity'] ?? 1,
      product: ProductModel.fromJson(json['products']),
    );
  }

  FavoriteEntity toEntity() {
    return FavoriteEntity(
      id: id,
      productId: productId,
      userId: userId,
      quanitty: quantity,
      productEntity: product.toEntity(),
    );
  }
}
