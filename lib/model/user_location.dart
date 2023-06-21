class UserLocation {
  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.street,
    required this.coordinates,
    required this.timezone,
  });

  factory UserLocation.fromMap(Map<String, dynamic> json) {
    final street = LocationStreet.fromMap(json['street']);
    final coordinates = LocationCoordinates.fromMap(json['coordinates']);
    final timezone = LocationTimezone.fromMap(json['timezone']);
    return UserLocation(
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'].toString(),
      street: street,
      coordinates: coordinates,
      timezone: timezone,
    );
  }

  final String city;
  final LocationCoordinates coordinates;
  final String country;
  final String postcode;
  final String state;
  final LocationStreet street;
  final LocationTimezone timezone;
}

class LocationStreet {
  LocationStreet({
    required this.number,
    required this.name,
  });

  factory LocationStreet.fromMap(Map<String, dynamic> json) {
    return LocationStreet(
      number: json['number'],
      name: json['name'],
    );
  }

  final String name;
  final int number;
}

class LocationCoordinates {
  LocationCoordinates({
    required this.latitude,
    required this.longitude,
  });

  factory LocationCoordinates.fromMap(Map<String, dynamic> json) {
    return LocationCoordinates(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  final String latitude;
  final String longitude;
}

class LocationTimezone {
  LocationTimezone({
    required this.offset,
    required this.description,
  });

  factory LocationTimezone.fromMap(Map<String, dynamic> json) {
    return LocationTimezone(
      offset: json['offset'],
      description: json['description'],
    );
  }

  final String description;
  final String offset;
}
