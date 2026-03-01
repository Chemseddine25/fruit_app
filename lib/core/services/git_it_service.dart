import 'package:fruit_app/core/repos/product_repos/product_repo_impl.dart';
import 'package:fruit_app/core/repos/product_repos/product_repos.dart';
import 'package:fruit_app/core/services/database_service.dart';
import 'package:fruit_app/core/services/supbase_auth_service.dart';
import 'package:fruit_app/core/services/supbase_database.dart';
import 'package:fruit_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_app/features/main_view/data/repos/favorite_repo_impl.dart';
import 'package:fruit_app/features/main_view/domain/repos/favorite_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  // Services
  getIt.registerSingleton<SupbaseAuthService>(SupbaseAuthService());
  getIt.registerSingleton<DatabaseService>(SupbaseDatabase());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
      supbaseAuthService: getIt<SupbaseAuthService>(),
      databaseService: getIt<DatabaseService>()));
  getIt.registerSingleton<ProductsRepo>(
      ProductsRepoImpl(databaseService: getIt<DatabaseService>()));

  getIt.registerSingleton<FavoriteRepo>(
      FavoriteRepoImpl(databaseService: getIt<DatabaseService>()));
}
