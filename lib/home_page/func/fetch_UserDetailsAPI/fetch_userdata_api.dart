import 'dart:convert';
import 'package:http/http.dart' as http;

class UserDetails {
  int id;
  String name;
  String username;
  String email;
  String phone;
  String website;
  String street;
  String suite;
  String city;
  String zipcode;
  UserDetails({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
  });
  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      street: json['address']['street'],
      suite: json['address']['suite'],
      city: json['address']['city'],
      zipcode: json['address']['zipcode'],
    );
  }
}

Future<List<UserDetails>> fetchUserData() async {
  String url = "https://jsonplaceholder.typicode.com/users";
  final response = await http.get(
    Uri.parse(url),
  );
  if (response.statusCode == 200) {
    List<dynamic> decodeData = jsonDecode(response.body);
    return decodeData.map((json) => UserDetails.fromJson(json)).toList();
  } else {
    throw Exception("Failed to load user details");
  }
}
