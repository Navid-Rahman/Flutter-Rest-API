import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rest_api/model/user.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          // final firstName = user['name']['first'];
          // final lastName = user['name']['last'];
          final email = user.email;
          final phone = user.phone;
          final gender = user.gender;
          final nat = user.nat;
          final cell = user.cell;
          final color = user.gender == 'male' ? Colors.blue : Colors.green;
          // final imageURL = user['picture']['thumbnail'];
          return ListTile(
            title: Text(email),
            tileColor: color,
            subtitle: Text(cell),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
      ),
    );
  }

  void fetchUsers() async {
    print('fetchUsers Called');

    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final jsonData = jsonDecode(body);
    final results = jsonData['results'] as List<dynamic>;
    final transformed = results.map((e) {
      return User(
        gender: e['gender'],
        email: e['email'],
        cell: e['cell'],
        nat: e['nat'],
        phone: e['phone'],
      );
    }).toList();
    setState(() {
      users = transformed;
    });

    print('fetchUsers completed');
  }
}
