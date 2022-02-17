class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final AddressGeo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'] as String,
      suite: json['suite'] as String,
      city: json['city'] as String,
      zipcode: json['zipcode'] as String,
      geo: AddressGeo.fromJson(json['geo']),
    );
  }
}
class AddressGeo {
  final String lat;
  final String lng;

  AddressGeo({
    required this.lat,
    required this.lng
  });

  factory AddressGeo.fromJson(Map<String, dynamic> json) {
    return AddressGeo(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}