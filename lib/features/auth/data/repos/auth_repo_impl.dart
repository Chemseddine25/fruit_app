import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/errors/custom_expection.dart';
import 'package:fruit_app/core/errors/failures.dart';
import 'package:fruit_app/core/services/database_service.dart';
import 'package:fruit_app/core/services/supbase_auth_service.dart';
import 'package:fruit_app/core/utils/back_end.dart';
import 'package:fruit_app/features/auth/data/models/user_model.dart';
import 'package:fruit_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl extends AuthRepo {
  final SupbaseAuthService supbaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl(
      {required this.databaseService, required this.supbaseAuthService});
  Future<void> deleteUser({required String userId}) async {
    try {
      // استدعاء الـ Edge Function التي قمنا برفعها
      final response = await Supabase.instance.client.functions.invoke(
        'delete-user', // اسم الدالة كما رفعته في الـ CLI
        body: {'userId': userId},
      );

      // التحقق مما إذا كان هناك خطأ في الاستجابة
      if (response.status != 200) {
        print('فشل الحذف من السيرفر: ${response.data}');
      } else {
        print('تم حذف المستخدم من السيرفر بنجاح: ${response.data}');
      }
    } catch (e) {
      // طباعة الخطأ في حال فشل الاتصال بالسيرفر
      print('خطأ غير متوقع أثناء استدعاء دالة الحذف: $e');
      // ملاحظة: لا نرفع Exception هنا لكي لا نعطل تدفق الخطأ الأصلي في عملية التسجيل
    }
  }

  Future<Either<Failure, UserEntity>> singUpUser(
    String name,
    String email,
    String password,
  ) async {
    User? user;
    try {
      user = await supbaseAuthService.singUpUserFunc(
          name: name, email: email, password: password);

      var userEntity = UserEntity(name: name, email: email, uId: user.id);

      await adduserData(userEntity);

      return Right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await deleteUser(userId: user.id);
      }

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

  @override
  Future adduserData(UserEntity user) {
    return databaseService.addData(BackendEndpoint.addUserData, user.toMap());
  }
}
