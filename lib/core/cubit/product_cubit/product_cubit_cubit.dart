import 'package:bloc/bloc.dart';
import 'package:fruit_app/core/entities/product_entity.dart';
import 'package:fruit_app/core/repos/product_repos/product_repos.dart';

part 'product_cubit_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(
    this.productsRepo,
  ) : super(ProductInitial());
  final ProductsRepo productsRepo;
  int productslength = 0;

  Future<void> getProducts() async {
    emit(ProductLoading());
    final result = await productsRepo.getProducts();
    result.fold((failure) => emit(ProductFailure(failure.message)),
        (products) => emit(ProductSuccess(products)));
  }

  Future<void> getbestSellingProducts() async {
    emit(ProductLoading());
    final result = await productsRepo.bestSellingProducts();
    result.fold((failure) => emit(ProductFailure(failure.message)), (products) {
      productslength = products.length;

      emit(ProductSuccess(products));
    });
  }
}
