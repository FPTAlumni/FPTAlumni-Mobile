

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/referral.dart';
import 'package:uni_alumni/models/request/referral_post_request.dart';
import 'package:uni_alumni/models/request/referral_request.dart';
import 'package:uni_alumni/models/request/voucher_get_request.dart';
import 'package:uni_alumni/models/voucher.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/refferal/referral_repository.dart';
import 'package:uni_alumni/modules/voucher/voucher_repository.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/data/enum/common_enum.dart';

class ReferralController extends GetxController{

  final ReferralRepository referralRepository;
  final VoucherRepository voucherRepository;
  final userAuthentication = Get.find<AuthController>().userAuthentication;
  final currentUser = Get.find<AuthController>().currentUser;


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
  // Future<void> refreshReferralList() async
  // {
  //   isLoading.value = false;
  //   vouchers.value = [];
  //   await getReferralByAlumni();
  // }
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
      if(voucher.relationshipName == relationShip)
        return voucher.id;
    }
    return 6;
  }
  //submit form

  Future<bool?> onSubmitReferralForm(){

    String highsSchool =  highSchoolNameValue.text.isEmpty ? "" : highSchoolNameValue.text;
    String  parentName = parentNameValue.text.isEmpty ? "" :  parentNameValue.text;
    String parentPhone = parentPhoneValue.text.isEmpty ? "": parentPhoneValue.text;
    int voucherId = getVoucherId(voucherIdValue.text);
    print(">>voucher id: "  + voucherId.toString());

    ReferralPostRequest data = ReferralPostRequest(
      nominatorId: userAuthentication!.id,
      fullName: fullNameValue.text,
      address: addressValue.text,
      highSchoolName: highsSchool,
      parentName: parentName,
      parentPhone: parentPhone,
      phone: phoneValue.text,
      voucherId: voucherId
    );

    return _createReferral(data);
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

  @override
  void onInit() {
    super.onInit();
    getReferralByAlumni();
    getVouchers();


  }
}