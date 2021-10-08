class Clazz {
  int id;
  String name;
  int? startYear;

  Clazz({required this.id, required this.name, this.startYear});

  factory Clazz.fromJson(Map<String, dynamic> json) => Clazz(
      id: json['id'],
      name: json['class_of'],
      startYear: json['start_year']);
}


