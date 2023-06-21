import 'package:flutter_rest_api/model/user_dob.dart';
import 'package:flutter_rest_api/model/user_location.dart';
import 'package:flutter_rest_api/model/user_name.dart';
import 'package:flutter_rest_api/model/user_picture.dart';

class User {
  final String email;
  final String phone;
  final String gender;
  final String nat;
  final String cell;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  final UserPicture picture;

  User({
    required this.email,
    required this.phone,
    required this.gender,
    required this.nat,
    required this.cell,
    required this.name,
    required this.dob,
    required this.location,
    required this.picture,
  });

  factory User.fromMap(Map<String, dynamic> e) {
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
  }

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
