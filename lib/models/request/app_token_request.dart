class AppTokenRequest {
  String tokenId; //firebase token
  int universityId;

  AppTokenRequest({required this.tokenId, required this.universityId});

  Map<String, dynamic> toJson() => {
        "token": tokenId,
        "university_id": universityId.toString(),
      };
}
