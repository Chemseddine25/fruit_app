import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/errors/failures.dart';
import 'package:fruit_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> singUpUser(
    String name,
    String email,
    String password,
  );

  Future<Either<Failure, UserEntity>> loginUser(
    String email,
    String password,
  );

  Future adduserData(UserEntity user);
}
