

import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/models/referral.dart';
import 'package:uni_alumni/models/request/referral_post_request.dart';
import 'package:uni_alumni/models/request/referral_request.dart';
import 'package:uni_alumni/models/request/voucher_get_request.dart';
import 'package:uni_alumni/models/voucher.dart';

class ReferralRepository {
  final ApiProvider apiProvider;

  ReferralRepository({required this.apiProvider});

  Future<List<Referral>?> getReferrals(String token, ReferralRequest params) async {
    final response  = await apiProvider.getReferrals('/Referral', token, params);
    if(response.statusCode == 200){
      List responseList = response.body['data'];
      return responseList.map((referral) => Referral.fromJson(referral)).toList();
    }

    if(response.statusCode == 204){
      throw Exception('No referral was found');
    }
  }

  Future<bool> createReferral(
      String token, ReferralPostRequest data) async {
    final response = await apiProvider.createReferral('/Referral', token, data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> deleteReferral(String appToken, int id) async {
    final response = await apiProvider.deleteReferral('/Referral/$id', appToken);
    if(response.statusCode == 200){
      return true;
    }
    return false;
  }

  Future<Referral?> updateReferral(String appToken, ReferralPostRequest data) async {
    final response = await apiProvider.updateReferral('/Referral', appToken, data);
    print('>>Repository: ' + response.statusCode.toString());
    if(response.statusCode == 200){
      return Referral.fromJson(response.body['data']);
    }
    return null;
  }

}
