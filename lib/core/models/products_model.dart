import 'package:fruit_app/core/entities/product_entity.dart';
import 'package:fruit_app/core/models/reviews_model.dart';

class ProductModel {
  final String productId;
  final String nameProduct;
  final num priceProduct;
  final num expirationProduct;
  final num numberofcaloriesProduct;
  final num unitsProduct;
  final String descriptionProduct;
  final String codeProduct;
  final bool isFeatured;
  final bool isOrganic;
  final int stock;
  final num sellingCount;
  String? urlImageProduct;
  final List<ReviewsModel> reviews;
  ProductModel({
    required this.productId,
    required this.nameProduct,
    required this.priceProduct,
    required this.expirationProduct,
    required this.numberofcaloriesProduct,
    required this.unitsProduct,
    required this.descriptionProduct,
    required this.codeProduct,
    required this.isFeatured,
    required this.isOrganic,
    required this.stock,
    required this.sellingCount,
    required this.reviews,
    this.urlImageProduct,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productId: json["id"].toString(),
        nameProduct: json["name_product"] ?? "",
        priceProduct: json["price_product"] ?? 0,
        expirationProduct: json["expiration_product"] ?? 0,
        numberofcaloriesProduct: json["numberofcalories_product"] ?? 0,
        unitsProduct: json["units_product"] ?? 0,
        descriptionProduct: json["description_product"] ?? "",
        codeProduct: json["code_product"] ?? "",
        isFeatured: json["is_featured"] ?? false,
        isOrganic: json["is_organic"] ?? false,
        stock: json["stock"] ?? 100,
        sellingCount: json["selling_count"] ?? 0,
        urlImageProduct: json["url_image_product"],
        reviews: json["reviews"] == null
            ? []
            : List<ReviewsModel>.from(
                json["reviews"].map((e) => ReviewsModel.fromJson(e))),
      );

  ProductEntity toEntity() {
    return ProductEntity(
      productId: productId,
      nameProduct: nameProduct,
      priceProduct: priceProduct,
      expirationProduct: expirationProduct,
      numberofcaloriesProduct: numberofcaloriesProduct,
      unitsProduct: unitsProduct,
      descriptionProduct: descriptionProduct,
      codeProduct: codeProduct,
      isFeatured: isFeatured,
      isOrganic: isOrganic,
      stock: stock,
      urlImageProduct: urlImageProduct,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }

  toJson() => {
        "name_product": nameProduct,
        "price_product": priceProduct,
        "expiration_product": expirationProduct,
        "numberofcalories_product": numberofcaloriesProduct,
        "units_product": unitsProduct,
        "description_product": descriptionProduct,
        "code_product": codeProduct,
        "is_featured": isFeatured,
        "is_organic": isOrganic,
        "stock": stock,
        "selling_count": sellingCount,
        "url_image_roduct": urlImageProduct,
        "reviews": reviews.map((e) => e.toJson()).toList()
      };
}
