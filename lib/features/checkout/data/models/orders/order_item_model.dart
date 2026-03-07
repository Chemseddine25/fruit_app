import 'package:fruit_app/features/checkout/presentation/domain/enitities/order_entities/odrer_item_entity.dart';

class OrderItemModel {
  final String productId;
  final String name;
  final num price;
  final int quantity;
  final String? imageUrl;

  OrderItemModel({
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
    this.imageUrl,
  });

  factory OrderItemModel.fromEntity(OrderItemEntity entity) {
    return OrderItemModel(
      productId: entity.productId,
      name: entity.name,
      price: entity.price,
      quantity: entity.quantity,
      imageUrl: entity.imageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'name': name,
      'price': price,
      'quantity': quantity,
      'image_url': imageUrl,
    };
  }
}
