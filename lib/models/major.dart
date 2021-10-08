class Major {
  String shortName;
  String vietnameseName;
  String? createdDate;
  int status;
  int id;
  String fullName;

  Major({
    required this.shortName,
    required this.vietnameseName,
    required this.status,
    required this.id,
    required this.fullName,
    this.createdDate,
  });

  factory Major.fromJson(Map<String, dynamic> json) => Major(
        shortName: json['short_name'],
        vietnameseName: json['vietnamese_name'],
        createdDate: json['created_date'],
        status: json['status'],
        id: json['id'],
        fullName: json['full_name'],
      );
}
