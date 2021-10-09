// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      id: json['id'] as int,
      companyName: json['company_name'] as String,
      location: json['location'] as String,
      business: json['business'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'company_name': instance.companyName,
    'location': instance.location,
    'business': instance.business,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  return val;
}
