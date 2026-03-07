import 'package:fruit_app/features/checkout/presentation/domain/enitities/order_entities/order_input_entity.dart';
import 'package:fruit_app/features/checkout/presentation/domain/enitities/paypel_entities/paypel_details_entity.dart';

class AmountEntity {
  final String total;
  final String currency;
  DetailsEntity? details;

  AmountEntity(
      {required this.total,
      required this.currency,
      required DetailsEntity details});

  factory AmountEntity.fromEntity(OrderInputEntity entity) {
    return AmountEntity(
      total: entity.calculateTotalPriceWithShipping().toStringAsFixed(2),
      currency: "USD",
      details: DetailsEntity.fromEntity(entity),
    );
  }

  toJson() => {"total": total, "currency": currency, "details": details};
}
