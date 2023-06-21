import 'package:flutter_rest_api/model/user_name.dart';

class User {
  final String email;
  final String phone;
  final String gender;
  final String nat;
  final String cell;
  final UserName name;

  User({
    required this.email,
    required this.phone,
    required this.gender,
    required this.nat,
    required this.cell,
    required this.name,
  });

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
