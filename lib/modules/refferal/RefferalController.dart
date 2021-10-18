

import 'package:get/get.dart';

class ReferralController extends GetxController{

  List vouchers = ['30%', '40%', '50%', '10%'];
  String? value;
  String? selectedValue = "Please choose a voucher";

  // setState(){
  //   print(selectedValue);
  //   value = this.selectedValue;
  // }
  void relationShipStatus(String? discount){
    print(discount);
    selectedValue = discount!;
    update();
  }

  String? displayValue(){
      return this.value;
  }


  @override
  void onInit() {
    super.onInit();
  }
}