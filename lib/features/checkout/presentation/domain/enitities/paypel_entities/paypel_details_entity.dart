import 'package:fruit_app/features/checkout/presentation/domain/enitities/order_entities/order_input_entity.dart';

class DetailsEntity {
  final String subtotal;
  final String shipping;
  final double shippingDiscount;

  DetailsEntity(
      {required this.subtotal,
      required this.shipping,
      required this.shippingDiscount});

  factory DetailsEntity.fromEntity(OrderInputEntity entity) {
    return DetailsEntity(
      subtotal: entity.totalPrice.toDouble().toStringAsFixed(2),
      shipping: entity.calculateShippingCost().toDouble().toStringAsFixed(2),
      shippingDiscount: 0.0,
    );
  }

  toJson() => {
        'subtotal': subtotal,
        'shipping': shipping,
        'shipping_discount': shippingDiscount.toStringAsFixed(2),
      };
}
