import 'package:fruit_app/features/checkout/presentation/domain/enitities/order_entities/odrer_item_entity.dart';
import 'package:fruit_app/features/checkout/presentation/domain/enitities/order_entities/shippinig_adress_entity.dart';

class OrderInputEntity {
  final String userId;
  final List<OrderItemEntity> items;
  ShpippingAdressEntity? shippingAddress;
  final num totalPrice;
  bool? isPaid;

  OrderInputEntity({
    required this.userId,
    required this.items,
    required this.totalPrice,
    this.shippingAddress,
    this.isPaid,
  });

  num calculateShippingCost() {
    return (isPaid ?? false) ? 30 : 0;
  }

  static num calculateFinalPrice(List<OrderItemEntity> items) {
    return items.fold(0, (sum, item) => sum + item.totalPrice);
  }

  num calculateTotalPriceWithShipping() {
    return totalPrice + calculateShippingCost();
  }
}
