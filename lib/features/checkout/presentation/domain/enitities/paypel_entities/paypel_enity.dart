import 'dart:math';

import 'package:fruit_app/features/checkout/presentation/domain/enitities/order_entities/order_input_entity.dart';
import 'package:fruit_app/features/checkout/presentation/domain/enitities/paypel_entities/amount.dart';
import 'package:fruit_app/features/checkout/presentation/domain/enitities/paypel_entities/paypel_details_entity.dart';
import 'package:fruit_app/features/checkout/presentation/domain/enitities/paypel_entities/paypel_item_entity.dart';
import 'package:fruit_app/features/checkout/presentation/domain/enitities/paypel_entities/paypel_item_list_entity.dart';

class PaypalPaymentEntity {
  AmountEntity? amount;
  DetailsEntity? details;
  final String? description;
  ItemListEntity? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  factory PaypalPaymentEntity.fromEntity(OrderInputEntity entity) {
    return PaypalPaymentEntity(
      amount: AmountEntity.fromEntity(entity),
      description: "Fruits Order",
      itemList: ItemListEntity.fromEntity(
          entity.items.map((item) => ItemEntity.fromEntity(item)).toList()),
    );
  }

  toJson() => {
        "amount": amount!.toJson(),
        "description": description,
        "itemList": itemList!.toJson(),
      };
}
