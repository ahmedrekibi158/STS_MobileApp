import 'package:intl/intl.dart';

class Passenger {
  String email;
  String password;
  String lastname;
  String firstname;

  late final DateTime birthday;
  String address;
  String profession;

  Passenger({
    required this.email,
    required this.password,
    this.firstname = "",
    this.lastname = "",
    this.address = "",
    this.profession = "",
    DateTime? birthday,
  }): this.birthday = birthday ?? DateTime.now();


}
