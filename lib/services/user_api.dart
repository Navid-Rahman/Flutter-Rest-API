import 'package:flutter_rest_api/model/user.dart';
import 'package:flutter_rest_api/model/user_name.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    print('fetchUsers Called');

    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final jsonData = jsonDecode(body);
    final results = jsonData['results'] as List<dynamic>;
    final users = results.map((e) {
      final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last'],
      );
      return User(
        gender: e['gender'],
        email: e['email'],
        cell: e['cell'],
        nat: e['nat'],
        phone: e['phone'],
        name: name,
      );
    }).toList();
    return users;
  }
}
