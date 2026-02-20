part of 'product_cubit_cubit.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductCubitLoading extends ProductState {}

final class ProductFailure extends ProductState {
  final String errmessage;
  ProductFailure(this.errmessage);
}

final class ProductSuccess extends ProductState {
  final List<ProductEntity> products;
  ProductSuccess(this.products);
}
