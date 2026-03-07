import 'package:fruit_app/features/checkout/data/models/orders/order_item_model.dart';
import 'package:fruit_app/features/checkout/data/models/orders/shipping_adress_model.dart';
import 'package:fruit_app/features/checkout/presentation/domain/enitities/order_entities/order_input_entity.dart';

class OrderModel {
  final String userId;
  final num totalPrice;
  final List<OrderItemModel> orderItems;
  final ShippingAddressModel shippingAddress;
  final bool isPaid;

  OrderModel({
    required this.userId,
    required this.totalPrice,
    required this.orderItems,
    required this.shippingAddress,
    required this.isPaid,
  });

  factory OrderModel.fromEntity(OrderInputEntity entity) {
    return OrderModel(
      userId: entity.userId,
      totalPrice: entity.totalPrice,
      isPaid: entity.isPaid ?? false,
      orderItems:
          entity.items.map((e) => OrderItemModel.fromEntity(e)).toList(),
      shippingAddress: ShippingAddressModel.fromEntity(entity.shippingAddress!),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'total_price': totalPrice,
      'is_paid': isPaid,
      'order_items': orderItems.map((e) => e.toJson()).toList(),
      'shipping_address': shippingAddress.toJson(),
    };
  }
}
