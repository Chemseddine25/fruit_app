class OrderItemEntity {
  final String productId;
  final String name;
  final num price;
  final int quantity;
  final String? imageUrl;

  OrderItemEntity({
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
    this.imageUrl,
  });

  num get totalPrice => price * quantity;
}
