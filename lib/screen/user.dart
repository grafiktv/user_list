class User {
  final int id;
  final String name;
  final String email;
  final String userName;
  final String phone;
  final String website;
  final Address address;
  final Company company;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.userName,
    required this.phone,
    required this.website,
    required this.address,
    required this.company
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      userName: json['username'],
      phone: json['phone'],
      website: json['website'],
      address: Address.fromJson(json['address']),
      company: Company.fromJson(json['company']),
    );
  }
}

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

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'] as String,
      catchPhrase: json['catchPhrase'] as String,
      bs: json['bs'] as String,
    );
  }
}

class UserTodo {
  final int userid;
  final int idtask;
  final String title;
  final bool comp;

  UserTodo({
    required this.userid,
    required this.idtask,
    required this.title,
    required this.comp,
  });

  factory UserTodo.fromJson(Map<String, dynamic> json) {
    return UserTodo(
      userid: json['userId'],
      idtask: json['id'],
      title: json['title'],
      comp: json['completed']
    );
  }

  @override toString() => 'title: $title';
}

