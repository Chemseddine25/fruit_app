import 'package:fruit_app/features/checkout/presentation/domain/enitities/paypel_entities/paypel_item_entity.dart';

class ItemListEntity {
  final List<ItemEntity> items;

  ItemListEntity({required this.items});

  factory ItemListEntity.fromEntity(List<ItemEntity> items) {
    return ItemListEntity(items: items);
  }

  Map<String, dynamic> toJson() {
    return {
      "items": items.map((e) => e.toJson()).toList(),
    };
  }
}
