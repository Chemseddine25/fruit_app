import 'package:bloc/bloc.dart';
import 'package:fruit_app/core/entities/product_entity.dart';
import 'package:fruit_app/core/repos/product_repos/product_repos.dart';

part 'product_cubit_state.dart';

class ProductCubitCubit extends Cubit<ProductState> {
  ProductCubitCubit(this.productsRepo) : super(ProductInitial());
  final ProductsRepo productsRepo;

  Future<void> getProducts() async {
    emit(ProductCubitLoading());
    final result = await productsRepo.getProducts();
    result.fold((failure) => emit(ProductFailure(failure.message)),
        (products) => emit(ProductSuccess(products)));
  }

  Future<void> getbestSellingProducts() async {
    emit(ProductCubitLoading());
    final result = await productsRepo.bestSellingProducts();
    result.fold((failure) => emit(ProductFailure(failure.message)),
        (products) => emit(ProductSuccess(products)));
  }
}
