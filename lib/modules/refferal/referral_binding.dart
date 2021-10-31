

import 'package:get/get.dart';
import 'package:uni_alumni/modules/refferal/referral_controller.dart';
import 'package:uni_alumni/modules/refferal/referral_repository.dart';
import 'package:uni_alumni/modules/voucher/voucher_repository.dart';

class ReferralBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ReferralController(referralRepository: ReferralRepository(apiProvider: Get.find()),
                                         voucherRepository: VoucherRepository(apiProvider: Get.find())));
  }
}