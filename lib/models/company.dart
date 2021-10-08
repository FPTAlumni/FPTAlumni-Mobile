import 'dart:convert';

class Company {
  int id;
  String companyName;
  String location;
  String business;
  String? description;

  Company(
      {required this.id,
      required this.companyName,
      required this.location,
      required this.business,
      this.description});

  factory Company.formJson(Map<String, dynamic> json) => Company(
        id: json['id'],
        companyName: json['company_name'],
        location: json['location'],
        business: json['business'],
        description: json['description'],
      );
}
