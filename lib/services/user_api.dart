import 'dart:ui';

import 'package:flutter_rest_api/model/user.dart';
import 'package:flutter_rest_api/model/user_dob.dart';
import 'package:flutter_rest_api/model/user_location.dart';
import 'package:flutter_rest_api/model/user_name.dart';
import 'package:flutter_rest_api/model/user_picture.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=10';
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
      final date = e['dob']['date'];
      final dob = UserDob(
        date: DateTime.parse(date),
        age: e['dob']['age'],
      );
      final street = LocationStreet(
        number: e['location']['street']['number'],
        name: e['location']['street']['name'],
      );
      final coordinates = LocationCoordinates(
        latitude: e['location']['coordinates']['latitude'],
        longitude: e['location']['coordinates']['longitude'],
      );
      final timezone = LocationTimezone(
        offset: e['location']['timezone']['offset'],
        description: e['location']['timezone']['description'],
      );
      final location = UserLocation(
        city: e['location']['city'],
        state: e['location']['state'],
        country: e['location']['country'],
        postcode: e['location']['postcode'].toString(),
        street: street,
        coordinates: coordinates,
        timezone: timezone,
      );
      final picture = UserPicture(
        large: e['pictures']['large'],
        medium: e['picutures']['medium'],
        thumbnail: e['pictures']['thumbnail'],
      );
      return User(
        gender: e['gender'],
        email: e['email'],
        cell: e['cell'],
        nat: e['nat'],
        phone: e['phone'],
        name: name,
        dob: dob,
        location: location,
        picture: picture,
      );
    }).toList();
    return users;
  }
}
