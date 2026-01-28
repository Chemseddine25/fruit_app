import 'package:bloc/bloc.dart';
import 'package:fruit_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepo}) : super(LoginInitial());
  final AuthRepo authRepo;

  Future<UserEntity?> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    final result = await authRepo.loginUser(email, password);
    return result.fold((failure) {
      emit(LoginFailure(failure.message));
      return null;
    }, (userEntity) {
      emit(LoginSuccess(userEntity));
      return userEntity;
    });
  }
}
