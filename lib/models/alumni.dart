

class Alumni {
  late int id;
  late String fullName;
  late String image;
  late String email;//idea: dựa vào email để lấy hình, được lưu trên SQL.
  late String address;
  late String password;
  late DateTime dob;
  late String job;
  late bool status;
  late int companyId;


  Alumni(this.fullName, this.image, this.email);
}



