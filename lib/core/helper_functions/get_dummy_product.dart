import 'package:fruit_app/core/entities/product_entity.dart';
import 'package:fruit_app/core/entities/reviews_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    productId: "1",
    nameProduct: "Apple",
    priceProduct: 20,
    expirationProduct: 5,
    numberofcaloriesProduct: 52,
    unitsProduct: 100,
    descriptionProduct: "Fresh red apple",
    codeProduct: "A1",
    isFeatured: true,
    isOrganic: true,
    stock: 10,
    urlImageProduct: "",
    reviews: [
      ReviewEntity(
        userName: "Didine",
        userImg: "",
        ratting: 4,
        date: "15",
        reviewDescription: "Very good product",
      ),
    ],
  );
}

List<ProductEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
