import 'package:intl/intl.dart';
import 'package:uni_alumni/models/Major.dart';
import 'package:uni_alumni/models/clazz.dart';
import 'package:uni_alumni/models/company.dart';
import 'package:uni_alumni/shared/utils/format_utils.dart';

class AlumniInfo {
  String email;
  String phone;
  String fullName;
  String? address;
  String uid;
  DateTime dob;
  String? job;
  String? aboutMe;
  DateTime createdDate;
  String status;
  int id;
  Major? major;
  Clazz? clazz;
  Company? company;

  AlumniInfo({
    required this.id,
    required this.email,
    required this.phone,
    required this.fullName,
    required this.uid,
    required this.dob,
    required this.createdDate,
    required this.status,
    this.major,
    this.company,
    this.clazz,
    this.aboutMe,
    this.address,
    this.job,
  });

  factory AlumniInfo.fromJson(Map<String, dynamic> json) => AlumniInfo(
        id: json['id'],
        email: json['email'],
        phone: json['phone'],
        fullName: json['full_name'],
        uid: json['uid'],
        dob: DateFormat('dd/MM/yyyy').parse(json['dob']),
        createdDate:
            FormatUtils.fromddMMyyyyHHmmtoDateTime(json['created_date']),
        aboutMe: json['about_me'],
        address: json['address'],
        job: json['job'],
        status: json['status'],
        company: Company.formJson(json['company']),
        clazz: Clazz.fromJson(json['class']),
        major: Major.fromJson(json['major']),
      );
}
