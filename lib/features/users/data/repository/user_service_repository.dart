import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:testpro/features/users/data/model/user_model.dart';

final userServiceProvider = Provider((ref) => UserService());

class UserService {
  Future<List<User>> fetchUsers() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(url);
    print(response.statusCode);
    print('object');
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception("خطأ في تحميل المستخدمين");
    }
  }
}
