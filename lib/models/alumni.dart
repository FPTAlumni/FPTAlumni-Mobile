import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uni_alumni/models/major.dart';
import 'package:uni_alumni/models/clazz.dart';
import 'package:uni_alumni/models/company.dart';
import 'package:uni_alumni/shared/data/enum/alumni_enum.dart';
import 'package:uni_alumni/shared/utils/format_utils.dart';

part 'alumni.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Alumni {
  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'full_name')
  String? fullName;

  @JsonKey(name: 'address')
  String? address;

  @JsonKey(name: 'uid')
  String? uid;

  @JsonKey(name: 'dob')
  DateTime? dob;

  @JsonKey(name: 'job')
  String? job;

  @JsonKey(name: 'about_me')
  String? aboutMe;

  @JsonKey(name: 'image')
  String? image;

  @JsonKey(name: 'created_date')
  DateTime? createdDate;

  @JsonKey(name: 'status')
  AlumniStatus? status;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'major')
  Major? major;

  @JsonKey(name: 'class')
  Clazz? clazz;

  @JsonKey(name: 'company')
  Company? company;

  Alumni(
      {this.id,
      this.email,
      this.phone,
      this.fullName,
      this.uid,
      this.dob,
      this.createdDate,
      this.status,
      this.major,
      this.company,
      this.clazz,
      this.aboutMe,
      this.address,
      this.job,
      this.image});

  factory Alumni.fromJson(Map<String, dynamic> json) => _$AlumniFromJson(json);

  Map<String, dynamic> toJson() => _$AlumniToJson(this);
}
