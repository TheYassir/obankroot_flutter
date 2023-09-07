class CredentialModel {
  String accesstoken;
  String tokentype;

  CredentialModel({
    required this.accesstoken,
    required this.tokentype,
  });

  factory CredentialModel.fromJson(Map<String, dynamic> json) {
    return CredentialModel(
      accesstoken: json['access_token'],
      tokentype: json['token_type'],
    );
  }

  Map<String, dynamic> toJson() => {
        'access_token': accesstoken,
        'token_type': tokentype,
      };
}

// {access_token: 36|erYXOEPXYPdyYD2dWAzxnV12C4hi8OsDzsWji2ee, token_type: Bearer}