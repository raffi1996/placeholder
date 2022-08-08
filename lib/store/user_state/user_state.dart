import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import '../../databases/hive/hive.dart';
import '../../http/repositories/users_repository.dart';
import '../../models/user_model/user_model.dart';

part 'user_state.g.dart';

// ignore: library_private_types_in_public_api
class UserState = _UserState with _$UserState;

abstract class _UserState with Store {
  @observable
  List<UserModel> users = [];

  @action
  Future<void> getAllUsers() async {
    final usersInDb = HiveDB.getUsers();
    try {
      if (usersInDb.isEmpty) {
        users = await UserRepository.getAllUsers();
        HiveDB.putUser(users);
      } else {
        users = usersInDb;
      }
    } on DioError catch (e) {
      log(e.toString());
    }
  }
}
