

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/referral.dart';
import 'package:uni_alumni/models/request/referral_post_request.dart';
import 'package:uni_alumni/models/request/referral_request.dart';
import 'package:uni_alumni/models/request/voucher_get_request.dart';
import 'package:uni_alumni/models/voucher.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/home/main_controller.dart';
import 'package:uni_alumni/modules/refferal/referral_repository.dart';
import 'package:uni_alumni/modules/refferal/screens/referral_detail.dart';
import 'package:uni_alumni/modules/voucher/voucher_repository.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/data/enum/common_enum.dart';
import 'package:uni_alumni/shared/widgets/error_dialog.dart';

class ReferralController extends GetxController{

  final ReferralRepository referralRepository;
  final VoucherRepository voucherRepository;
  final userAuthentication = Get.find<AuthController>().userAuthentication;
  final currentUser = Get.find<AuthController>().currentUser;
  final  mainController = Get.find<MainController>();


  ReferralController({required this.referralRepository, required this.voucherRepository});
  String? value;
  var selectedVoucher = "".obs;

  final _pageSize = 6;
  int _page = 1;
  String? error;
  //List referrals from api
  var referrals = [].obs;
  var vouchers = [].obs;
  //lists of combobox
  var dropdownVoucher = [].obs;
  var dropdownType = [];

  var isLoading = true.obs;

  var fullNameValue = TextEditingController();
  var phoneValue = TextEditingController();
  var addressValue = TextEditingController();
  var nominatorIdValue = 0;
  var voucherIdValue = TextEditingController();
  var parentNameValue = TextEditingController();
  var parentPhoneValue = TextEditingController();
  var highSchoolNameValue = TextEditingController();

  Referral? currentReferral = Get.arguments;

  //Load Referrers
  Future<void> getReferralByAlumni()async {
    print('load referral');
    ReferralRequest params = ReferralRequest(
      nominatorId: userAuthentication!.id.toString(),
      sortOrder: SortOrder.DESC,
      page: _page.toString(),
      pageSize: '50'
    );
    try {
      List<Referral>? _referrals =
      await referralRepository.getReferrals(userAuthentication!.appToken, params);
      if(_referrals != null){
        error = null;
        referrals.addAll(_referrals);
        _page++;
      }
    }on Exception{
      error = 'No referral was loadeded';
    }
  }
  //Refresh referral list
  Future<void> refreshReferralList() async
  {
    isLoading.value = false;
    referrals.value=[];
    _page = 1;
    error = null;
    await getReferralByAlumni();
  }
  //Load vouchers
  Future<void> getVouchers() async {// toJson just include String
    print('Load vouchers');
    VoucherRequest params = VoucherRequest(
      majorId: currentUser!.major!.id.toString(),
      status: 'Active',
      page: _page.toString(),
      pageSize: '50',
      sortOrder: SortOrder.ASC,
    );
    try{
      List<Voucher>? _voucher = await voucherRepository.getVouchers(userAuthentication!.appToken, params);
      if(_voucher != null){
        print('load voucher');
        error = null;
        vouchers.addAll(_voucher);

        //add list voucher to dropdown list
        for (Voucher voucher in vouchers) {
          dropdownVoucher.add(DropdownMenuItem(
            child: Text(voucher.relationshipName),
            value: voucher.relationshipName,
          ));
        }
      }
    }on Exception{
      print('No voucher was loaded');
    }
  }
  int getVoucherId(String relationShip){
    for(Voucher voucher in vouchers){
      if(voucher.relationshipName == selectedVoucher.value)
        return voucher.id;
    }
    return 0;
  }
  //submit form

  Future<bool?> onSubmitReferralForm(){

    String highsSchool =  highSchoolNameValue.text.isEmpty ? "" : highSchoolNameValue.text;
    String  parentName = parentNameValue.text.isEmpty ? "" :  parentNameValue.text;
    String parentPhone = parentPhoneValue.text.isEmpty ? "": parentPhoneValue.text;
    int voucherId = getVoucherId(voucherIdValue.text);

    ReferralPostRequest data = ReferralPostRequest(
      id: currentReferral?.id,
      status: currentReferral?.status,
      nominatorId: userAuthentication!.id,
      fullName: fullNameValue.text,
      address: addressValue.text,
      highSchoolName: highsSchool,
      parentName: parentName,
      parentPhone: parentPhone,
      phone: phoneValue.text,
      voucherId: voucherId
    );

    if(currentReferral == null){
      return _createReferral(data);
    }else{
      return _updateReferral(data);
    }

  }

  Future<bool?> _createReferral(ReferralPostRequest data) async {
    bool result = await referralRepository.createReferral(
        userAuthentication!.appToken, data);
    if (result) {
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
    } else {
      return await _showErrorDialog();
    }
  }
  Future<bool?> _updateReferral(ReferralPostRequest data) async {
    Referral? updateReferral = await referralRepository.updateReferral(
      userAuthentication!.appToken, data);
    if(updateReferral != null){
      int index = referrals.indexWhere((referral) => referral.id == updateReferral.id);
      referrals[index] = updateReferral;
      referrals.refresh();
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

  //delete
  deleteReferral(int id) async {
    bool? result =
    await _showConfirmDialog(msg: 'Do you want to remove this referral? ');
    if (result == null) return;

    bool isSucceed =
    await referralRepository.deleteReferral(userAuthentication!.appToken, id);
    if (isSucceed) {
      referrals.removeWhere((referral) => referral.id == id);
      if (referrals.length < _pageSize) {
        isLoading.value = false;
      }
      referrals.refresh();
    } else {
      ErrorDialog.showDialog();
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

  //Change color of status
  Color changeColorStatus(int status) {
    switch (status) {
      case 0 :
        return Colors.grey;
      case 1 :
        return Colors.green;
      case 2 :
        return Colors.blue;
      case 3:
        return Colors.yellow;
      case 4:
        return Colors.red;
      default:
        return Colors.red;
    }
  }
  //Change name of status
  String statusName(int status){
    switch (status){
      case 0:
        return 'Inactive';
      case 1:
        return 'Verified';
      case  2:
        return 'Paid';
      case 3:
        return 'Pending';
      case 4:
        return 'Rejected';
      default:
        return 'Inactive';
    }
  }

  onChangeVoucher(Object? value) {
    selectedVoucher.value = value.toString();
  }

  bool isAvailableVoucher(int status){
    if(statusName(status) == 'Rejected' || statusName(status) == 'Inactive'){
      return false;
    }
    return true;
  }

  @override
  void onInit() {
    super.onInit();
    getReferralByAlumni();
    getVouchers();
  }

  @override
  void onReady() {
    super.onReady();
    print(">>Onready");
      if(currentReferral != null){
        fullNameValue.text = currentReferral?.fullName?? '';
        phoneValue.text = currentReferral?.phone?? '';
        addressValue.text = currentReferral?.address?? '';
        nominatorIdValue = userAuthentication!.id;
        selectedVoucher.value = currentReferral?.voucher?.relationshipName?? '';
        parentNameValue.text = currentReferral?.parentName?? '';
        parentPhoneValue.text = currentReferral?.parentPhone?? '';
        highSchoolNameValue.text = currentReferral?.highSchoolName?? '';
      }
    }
}
