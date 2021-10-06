class UserRequest {
  String tokenId;
  int universityId;

  UserRequest({required this.tokenId, required this.universityId});

  Map<String, dynamic> toJson() => {
        "idToken": tokenId,
        "universityId": universityId.toString(),
      };
}
