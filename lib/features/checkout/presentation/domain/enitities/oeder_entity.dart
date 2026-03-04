import 'package:fruit_app/features/checkout/presentation/domain/enitities/shippinig_adress_entity.dart';
import 'package:fruit_app/features/main_view/domain/entities/favorite_entity.dart';

class OrderEntity {
  final List<FavoriteEntity> favoriteEntity;
  bool? isPaid;

  final num totalPrice;

  final ShpippingAdressEntity? shippingAdressEntity;

  OrderEntity({
    required this.totalPrice,
    required this.favoriteEntity,
    this.isPaid,
    this.shippingAdressEntity,
  });
}

num calculateOrderTotalPrice(List<FavoriteEntity> items) {
  return items.fold(0, (sum, item) => sum + item.totalPrice());
}
