import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart'; 

@JsonSerializable(createToJson: true)
class UserModel {
  final int? id;
  final String? email;
  final String? username; 
  final String? password;
  final Name? name;
  final String? phone;
  final Address? address;

  UserModel({
    this.id,
    this.email,
    this.username,
    this.password,
    this.name,
    this.phone,
    this.address,
  });


  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  // bool get isNotEmpty => null;

  static List<UserModel> fromList(List<dynamic> data) =>
      data.map((e) => UserModel.fromJson(e)).toList();
}

@JsonSerializable(createToJson: true)
class Name {
  final String? firstname;
  final String? lastname;

  Name({this.firstname, this.lastname});


  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
}

@JsonSerializable(createToJson: true)
class Address {
  final Geolocation? geolocation;
  final String? city;
  final String? street;
  final int? number;
  final String? zipcode;

  Address({this.geolocation, this.city, this.street, this.number, this.zipcode});


  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}

@JsonSerializable(createToJson: true)
class Geolocation {
  final String? lat;
  final String? long;

  Geolocation({this.lat, this.long});


  factory Geolocation.fromJson(Map<String, dynamic> json) =>
      _$GeolocationFromJson(json);
}
