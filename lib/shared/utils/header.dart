class HeaderApi {
  final String token;

  HeaderApi(this.token);

  Map<String, String> getHeaders() {
    return {'Authorization': 'Bearer $token'};
  }
}
