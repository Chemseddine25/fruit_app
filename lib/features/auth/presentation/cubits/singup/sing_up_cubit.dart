import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repo.dart';

part 'sing_up_state.dart';

class SingUpCubit extends Cubit<SingUpState> {
  SingUpCubit({required this.authRepo}) : super(SingUpInitial());
  final AuthRepo authRepo;

  Future<UserEntity?> singUpUser(
      {required String name,
      required String email,
      required String password}) async {
    emit(SingUpLoading());
    final result = await authRepo.singUpUser(name, email, password);
    return result.fold((failure) {
      emit(SingUpFailure(errorMessage: failure.message));
      return null;
    }, (userEntity) {
      emit(SingUpSuccess(userEntity: userEntity));
      return userEntity;
    });
  }
}
