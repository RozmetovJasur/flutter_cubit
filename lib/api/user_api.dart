import 'dart:convert';

import 'package:flutter_cubit/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserApi {
  Future<List<UserModel>> getUser() async {
    final response =
        await http.get(Uri.parse('http://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final List<dynamic> user = json.decode(response.body);
      print(user);
      return user.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}
