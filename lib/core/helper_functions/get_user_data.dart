import 'dart:convert';

import 'package:fruit_app/features/auth/data/models/user_model.dart';
import 'package:fruit_app/features/auth/domain/entities/user_entity.dart';

import '../../constante.dart';
import '../services/share_perfences.dart';

UserEntity getUserData() {
  var jsondata = Prefs.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsondata));

  return userEntity;
}
