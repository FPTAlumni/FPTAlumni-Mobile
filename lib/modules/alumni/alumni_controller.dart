
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uni_alumni/api/firebase_api.dart';
import 'package:uni_alumni/models/alumni.dart';
import 'package:uni_alumni/models/company.dart';
import 'package:uni_alumni/models/request/alumni_request.dart';
import 'package:uni_alumni/models/request/company_request.dart';
import 'package:uni_alumni/modules/alumni/alumni_repository.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/auth/auth_repository.dart';
import 'package:uni_alumni/modules/company/company_repository.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/data/enum/common_enum.dart';
import 'package:uni_alumni/shared/utils/format_utils.dart';
import 'package:uni_alumni/shared/widgets/date_time_picker_dialog.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';

class AlumniController extends GetxController{

  final AlumniRepository alumniRepository;
  final CompanyRepository companyRepository;
  AuthRepository authRepository = Get.find();
  //company
  final userAuthentication = Get.find<AuthController>().userAuthentication;
  final user = Get.find<AuthController>().currentUser;
  AuthController authController = Get.find<AuthController>();
  String url =
      'https://i.pinimg.com/originals/48/a9/8a/48a98a3200a2fd9f857890aed4413357.jpg';


  AlumniController({required this.alumniRepository, required this.companyRepository});

  // var dobValue = "".obs;
  var selectedCompany = "".obs;
  var companyList = [].obs;
  var dropdownCompany = [].obs;
  DateTime? selectedDoB = DateTime.now();
  int _page = 1;
  String? error;
  File? selectedImage;
  String? _mimeType;

  var fullNameValue = TextEditingController();
  var phoneValue = TextEditingController();
  var addressValue = TextEditingController();
  var jobValue = TextEditingController();
  var dobValue = TextEditingController();
  var companyValue = TextEditingController();
  var aboutMeValue = TextEditingController();
  var imageValue = TextEditingController();
  void setOldValueAlumni(){
    fullNameValue.text = user?.fullName?? "No information";
    phoneValue.text = user?.phone?? "No information";
    addressValue.text = user?.address?? "No information";
    jobValue.text = user?.job?? "No information";
    selectedCompany.value = user?.company?.companyName?? "Other";
    aboutMeValue.text = user?.aboutMe?? "No information";

  }

// {
// "id": 0,
// "phone": "string",
// "full_name": "string",
// "address": "string",
// "dob": "2021-11-01T21:29:15.435Z",
// "job": "string",
// "about_me": "string",
// "company_id": 0, combo box
// "major_id": 0, major ko sửa -> ko cần hiện -> can nhac
// "class_id": 0, class ko sửa -> ko cần hiện -> Khoa
// "image": "string"  chọn ảnh -> hoi
// }
  //Làm giao diện form (text, date, combobox <- load combobox)
  //valid form
  //

  Future<bool?> onSubmitAlumniForm() async {



    String? imageUrl = user?.image;
    int? companyId = getCompanyId(selectedCompany.value.toString());
    int? majorId = user?.major?.id;
    int? classId = user?.clazz?.id;

    if(selectedImage != null){
      imageUrl = await uploadFile();
    }

    AlumniRequest data = AlumniRequest(
        id: userAuthentication?.id,
        phone: phoneValue.text,
        fullName: fullNameValue.text,
        address: addressValue.text,
        dob: user?.dob,
        job: jobValue.text,
        aboutMe: aboutMeValue.text,
        companyId: companyId,
        majorId: majorId,
        classId: classId,
        image: imageUrl);

    var result = _updateAlumni(data);
    return result;
  }

  Future<bool?> _updateAlumni(AlumniRequest data) async {
    Alumni? updateAlumni  = await alumniRepository.updateAlumni(
        userAuthentication!.appToken, data);
    if(updateAlumni != null){
      // int index = referrals.indexWhere((referral) => referral.id == updateReferral.id);
      // referrals[index] = updateReferral;
      // referrals.refresh();
      return await Get.defaultDialog(
        title: 'Announcement',
        content: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 5.0,
          ),
          child: Text('Updated information succeeded !!!'),
        ),
        confirm: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: ColorConstants.primaryAppColor,
            textStyle: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Get.back();
          },
          child: Text(
            'Close',
          ),
        ),
      );
    }else{
      return await _showErrorDialog();
    }
  }

  Future<void> getCompanies() async {
    print('load company');
    CompanyRequest params = CompanyRequest(
      sortOrder: SortOrder.ASC,
    );

    try{
      List<Company>? _company = await companyRepository.getCompanies(userAuthentication!.appToken, params);
      if(_company != null){
        print('List company not null');
        error = null;
        companyList.addAll(_company);

        for(Company company in companyList){
          dropdownCompany.add(DropdownMenuItem(
              child: Text(company.companyName?? 'Other'),
              value: company.companyName,
          ));
        }
      }
    }on Exception{
      print('No company was loaded');
    }
  }
  int? getCompanyId(String companyName) {
    for(Company  company in companyList){
      if(company.companyName == selectedCompany.value){
        return company.id;
      }
    }
    print("Company name to update: " + companyName);
    return 0 ;
  }
  onChangeCompany(Object? value){
    selectedCompany.value = value.toString();
  }

  Future<String?> uploadFile() async {
    if (selectedImage == null) return null;

    final fileName = DateFormat('yyyyMMddHHmmss').format(DateTime.now()) +
        "_" +
        basename(selectedImage!.path);

    print(fileName);
    final destination = 'alumni-images/$fileName';
    final task = FirebaseApi.uploadFile(destination, selectedImage!);

    if (task == null) return null;

    //get mime type
    _mimeType = lookupMimeType(destination);

    final snapshot = await task.whenComplete(() => {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print(_mimeType);

    print('Download link: $urlDownload');

    return urlDownload;
  }
  _showErrorDialog() async {
    return await Get.defaultDialog(
      title: 'Error!',
      content: Text('Some errors occurred'),
      cancel: TextButton(
        onPressed: () {
          Get.back(result: false);
        },
        child: Text('Cancel'),
      ),
    );
  }
  Future<bool?> _showConfirmDialog(
      {String title = 'Confirmation', required String msg}) {
    return Get.defaultDialog(
      title: title,
      content: Text(msg),
      confirm: TextButton(
          onPressed: () {
            Get.back(result: true);
          },
          child: Text('Confirm')),
      cancel: TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text('Cancel'),
      ),
    );
  }

  showDatePicker({DateTime? date}) async {
    DateTime? _dob =
    await DateTimePickerDialog.showDatePickerDialog(selectedDate: date);

    if (_dob != null) {
      selectedDoB = _dob;
      dobValue.text  = FormatUtils.toddMMyyyy(_dob);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCompanies();
  }

  Future<void> refreshUser() async {
    authController.currentUser = await authRepository.getUserById(
        userAuthentication!.id, userAuthentication!.appToken);
  }

  @override
  void refreshGroup(Object id) {

  }
}