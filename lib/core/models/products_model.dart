import 'package:fruit_app/core/entities/product_entity.dart';
import 'package:fruit_app/core/models/reviews_model.dart';

class ProductModel {
  final String nameProduct;
  final num priceProduct;
  final num expirationProduct;
  final num numberofcaloriesProduct;
  final num unitsProduct;
  final String descriptionProduct;
  final String codeProduct;
  final bool isFeatured;
  final bool isOrganic;
  final num sellingCount;
  String? urlImageProduct;
  final List<ReviewsModel> reviews;
  ProductModel({
    required this.nameProduct,
    required this.priceProduct,
    required this.expirationProduct,
    required this.numberofcaloriesProduct,
    required this.unitsProduct,
    required this.descriptionProduct,
    required this.codeProduct,
    required this.isFeatured,
    required this.isOrganic,
    required this.sellingCount,
    required this.reviews,
    this.urlImageProduct,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        nameProduct: json["nameProduct"],
        priceProduct: json["priceProduct"],
        expirationProduct: json["expirationProduct"],
        numberofcaloriesProduct: json["numberofcaloriesProduct"],
        unitsProduct: json["unitsProduct"],
        descriptionProduct: json["descriptionProduct"],
        codeProduct: json["codeProduct"],
        isFeatured: json["isFeatured"],
        isOrganic: json["isOrganic"],
        sellingCount: json["sellingCount"],
        urlImageProduct: json["urlImageProduct"],
        reviews: List<ReviewsModel>.from(
            json["reviews"].map((e) => ReviewsModel.fromJson(e))),
      );

  ProductEntity toEntity() {
    return ProductEntity(
        nameProduct: nameProduct,
        priceProduct: priceProduct,
        expirationProduct: expirationProduct,
        numberofcaloriesProduct: numberofcaloriesProduct,
        unitsProduct: unitsProduct,
        descriptionProduct: descriptionProduct,
        codeProduct: codeProduct,
        isFeatured: isFeatured,
        isOrganic: isOrganic,
        urlImageProduct: urlImageProduct,
        reviews: reviews.map((e) => e.toEntity()).toList());
  }

  toJson() => {
        "nameProduct": nameProduct,
        "priceProduct": priceProduct,
        "expirationProduct": expirationProduct,
        "numberofcaloriesProduct": numberofcaloriesProduct,
        "unitsProduct": unitsProduct,
        "descriptionProduct": descriptionProduct,
        "codeProduct": codeProduct,
        "isFeatured": isFeatured,
        "isOrganic": isOrganic,
        "sellingCount": sellingCount,
        "urlImageProduct": urlImageProduct,
        "reviews": reviews.map((e) => e.toJson()).toList()
      };
}
