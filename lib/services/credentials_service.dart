import 'package:obankroot/models/credentials_model.dart';

class CredentialsService {
  CredentialModel? creds;

  static final CredentialsService _singleton = CredentialsService._internal();
  factory CredentialsService() {
    return _singleton;
  }
  CredentialsService._internal();
}
