class RegistrationRequest {
  String uid; //uid get from firebase
  String phone;
  String fullName;
  String? address;
  DateTime dob;
  String? job;
  String? aboutMe;
  int? companyId;
  int? universityMajorId;
  int classId;

  RegistrationRequest({
    required this.uid,
    required this.phone,
    required this.fullName,
    required this.dob,
    required this.classId,
    this.address,
    this.aboutMe,
    this.companyId = 0,
    this.job,
    this.universityMajorId = 0,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'phone': phone,
        'full_name': fullName,
        'address': address,
        'dob': dob.toIso8601String(),
        'job': job,
        'about_me': aboutMe,
        'company_id': companyId,
        'class_id': classId,
      };
}
