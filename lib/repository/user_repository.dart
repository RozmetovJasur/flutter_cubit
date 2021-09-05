import 'package:flutter_cubit/api/user_api.dart';
import 'package:flutter_cubit/model/user_model.dart';

class UsersRepository {
  UserApi _usersAPi = UserApi();

  Future<List<UserModel>> getAllUsers() => _usersAPi.getUser();
}
