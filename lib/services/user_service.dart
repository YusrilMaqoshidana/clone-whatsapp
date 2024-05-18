import 'dart:convert';
import 'package:tugas_mandiri/models/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  static const String baseUrl = 'https://reqres.in/api';

  static Future<List<User>> fetchUser() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users?page=2'));
      if (response.statusCode == 200) {
        final body = response.body;
        final result = jsonDecode(body);
        List<User> users = List<User>.from(
          result['data'].map((user) => User.fromJson(user)),
        );
        return users;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
