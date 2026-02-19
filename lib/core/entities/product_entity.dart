import 'package:fruit_app/core/entities/reviews_entity.dart';

class ProductEntity {
  final String nameProduct;
  final num priceProduct;
  final num expirationProduct;
  final num numberofcaloriesProduct;
  final num unitsProduct;
  final String descriptionProduct;
  final String codeProduct;
  final bool isFeatured;
  final bool isOrganic;
  String? urlImageProduct;
  final List<ReviewEntity> reviews;

  ProductEntity(
      {required this.nameProduct,
      required this.priceProduct,
      required this.expirationProduct,
      required this.numberofcaloriesProduct,
      required this.unitsProduct,
      required this.descriptionProduct,
      required this.codeProduct,
      required this.isFeatured,
      required this.reviews,
      this.isOrganic = false,
      this.urlImageProduct});
}
