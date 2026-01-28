import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/errors/custom_expection.dart';
import 'package:fruit_app/core/errors/failures.dart';
import 'package:fruit_app/core/services/supbase_auth_service.dart';
import 'package:fruit_app/features/auth/data/models/user_model.dart';
import 'package:fruit_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final SupbaseAuthService supbaseAuthService;

  AuthRepoImpl({required this.supbaseAuthService});
  @override
  //
  Future<Either<Failure, UserEntity>> singUpUser(
    String name,
    String email,
    String password,
  ) async {
    try {
      var user = await supbaseAuthService.singUpUserFunc(
          name: name, email: email, password: password);

      return Right(UserModel.fromSupbaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginUser(
      String email, String password) async {
    try {
      var user = await supbaseAuthService.loginUserFunc(
          email: email, password: password);

      return Right(UserModel.fromSupbaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
