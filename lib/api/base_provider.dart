import 'package:get/get.dart';

import 'api_constants.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    allowAutoSignedCert = true;
    httpClient.baseUrl = ApiConstants.baseUrl;
    httpClient.defaultContentType = ApiConstants.contentType;
  }
}
