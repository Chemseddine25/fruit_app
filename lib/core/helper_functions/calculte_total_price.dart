import 'package:fruit_app/features/main_view/domain/entities/favorite_entity.dart';

double calculateTotalPrice(List<FavoriteEntity> items) {
  double total = 0.0;
  for (var item in items) {
    total += item.totalPrice();
  }
  return total;
}
