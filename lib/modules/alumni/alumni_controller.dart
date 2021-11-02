
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/alumni.dart';
import 'package:uni_alumni/models/request/alumni_request.dart';
import 'package:uni_alumni/modules/alumni/alumni_repository.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/utils/format_utils.dart';

class AlumniController extends GetxController{

  final AlumniRepository alumniRepository;
  //company
  final userAuthentication = Get.find<AuthController>().userAuthentication;

  AlumniController({required this.alumniRepository});

  var dobValue = "".obs;

  var fullNameValue = TextEditingController();
  var phoneValue = TextEditingController();
  var addressValue = TextEditingController();
  var jobValue = TextEditingController();
  // var dobValue = TextEditingController();
  var companyIdValue = TextEditingController();
  var aboutMeValue = TextEditingController();
  var imageValue = TextEditingController();

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

  // Future<bool?> onSubmitAlumniForm(){
  //
  //   AlumniRequest data = AlumniRequest(
  //       id: userAuthentication?.id,
  //       phone: phoneValue.text,
  //       fullName: fullNameValue.text,
  //       address: addressValue.text,
  //       dob: FormatUtils.,
  //       job: jobValue.text,
  //       aboutMe: aboutMeValue.text,
  //       companyId: 0,
  //       majorId: 0,
  //       classId: 0,
  //       image: imageValue);
  //
  //
  //   return true;
  // }

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
          child: Text('The referral has been created successfully.\r\n'
              'Please wait for admin to approve it'),
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

}