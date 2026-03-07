import 'package:fruit_app/features/checkout/presentation/domain/enitities/order_entities/odrer_item_entity.dart';

class ItemEntity {
  final String name;
  final String price;
  final int quantity;
  final String currency;
  const ItemEntity({
    required this.name,
    required this.price,
    required this.quantity,
    required this.currency,
  });

  factory ItemEntity.fromEntity(OrderItemEntity entity) {
    return ItemEntity(
      name: entity.name,
      price: entity.price.toDouble().toStringAsFixed(2),
      quantity: entity.quantity,
      currency: "USD",
    );
  }

  toJson() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity.toString(),
      'currency': currency,
    };
  }
}
