class University {
  int id;
  String name;
  String? logo;
  String? address;

  University({required this.id, required this.name, this.logo, this.address});

  factory University.fromJson(Map<String, dynamic> json) => University(
        id: json['id'],
        name: json['name'],
      );
}
