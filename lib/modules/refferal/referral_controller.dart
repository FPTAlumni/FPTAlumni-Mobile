

import 'package:get/get.dart';
import 'package:uni_alumni/models/referral.dart';
import 'package:uni_alumni/models/request/referral_request.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/refferal/referral_repository.dart';
import 'package:uni_alumni/shared/data/enum/common_enum.dart';

class ReferralController extends GetxController{

  final ReferralRepository referralRepository;
  final userAuthentication = Get.find<AuthController>().userAuthentication;

  ReferralController({required this.referralRepository});
  List vouchers = ['30%', '40%', '50%', '10%'];
  String? value;
  String? selectedValue = "Please choose a voucher";

  final _pageSize = 6;
  int _page = 1;
  String? error;
  //List referrals from api
  var referrals = [].obs;

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




  @override
  void onInit() {
    super.onInit();
    getReferralByAlumni();
  }
}