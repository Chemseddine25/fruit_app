import 'dart:developer'; // تأكد من استيراد هذه المكتبة لاستخدام log
import 'package:fruit_app/core/errors/custom_expection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupbaseAuthService {
  Future<User> singUpUserFunc({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse res = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
        data: {'username': name},
      );
      return res.user!;
    } on AuthException catch (e) {
      final String status = e.statusCode?.toString() ?? '';
      log("Supabase Auth Status Code: $status");

      if (e.message.toLowerCase().contains('network') ||
          e.message.toLowerCase().contains('connection') ||
          status == '0') {
        throw CustomException(message: 'تأكد من اتصالك بالإنترنت.');
      }

      if (e.message.toLowerCase().contains('weak password') ||
          status == '422') {
        throw CustomException(message: 'الرقم السري ضعيف جداً.');
      } else if (e.message.toLowerCase().contains('already registered')) {
        throw CustomException(
            message: 'لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول.');
      } else {
        throw CustomException(message: 'خطأ في المصادقة: ');
      }
    } catch (e) {
      log("Supabase Unknown Error: ${e.toString()}");
      if (e.toString().toLowerCase().contains('socketexception') ||
          e.toString().toLowerCase().contains('clientexception') ||
          e.toString().toLowerCase().contains('failed host lookup')) {
        throw CustomException(message: 'تأكد من اتصالك بالإنترنت.');
      }

      throw CustomException(
          message: 'لقد حدث خطأ غير متوقع. الرجاء المحاولة مرة أخرى.');
    }
  }
}
