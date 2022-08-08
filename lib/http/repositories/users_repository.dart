import '../../models/user_model/user_model.dart';
import '../dio.dart';

class UserRepository {
  static Future<List<UserModel>> getAllUsers() async {
    final response = await dio.get('/users');
    if (response.statusCode == 200) {
      List<UserModel> users = [];
      response.data.map((json) => users.add(UserModel.fromJson(json))).toList();

      return users;
    } else {
      throw Exception("server problem");
    }
  }
}
