import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uId});

  factory UserModel.fromSupbaseUser(User user) {
    return UserModel(
        name: user.userMetadata?['username'] ?? '',
        email: user.email ?? '',
        uId: user.id);
  }
}
