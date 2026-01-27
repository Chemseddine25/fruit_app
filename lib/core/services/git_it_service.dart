import 'package:fruit_app/core/services/supbase_auth_service.dart';
import 'package:fruit_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  // Services
  getIt.registerSingleton<SupbaseAuthService>(SupbaseAuthService());
  getIt.registerSingleton<AuthRepo>(
      AuthRepoImpl(supbaseAuthService: getIt<SupbaseAuthService>()));
}
