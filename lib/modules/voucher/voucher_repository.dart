
import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/models/request/voucher_get_request.dart';
import 'package:uni_alumni/models/voucher.dart';

class VoucherRepository{

  ApiProvider apiProvider;

  VoucherRepository({required this.apiProvider});

  Future<List<Voucher>?> getVouchers(String token, VoucherRequest params)  async {
    final response = await apiProvider.getVouchers('/Voucher', token, params);
    if(response.statusCode  ==  200){
      List  responseList = response.body['data'];
      return responseList.map((voucher) => Voucher.fromJson(voucher)).toList();
    }

  }

}