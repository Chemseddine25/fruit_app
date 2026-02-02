import 'package:fruit_app/features/auth/domain/entities/user_entity.dart';

abstract class DatabaseService {
  Future<void> addData(String path, Map<String, dynamic> data);
  Future<Map<String, dynamic>> getData(String path, String id);
}
