import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:obankroot/models/credentials_model.dart';
import 'package:obankroot/services/credentials_service.dart';

class AuthService {
  String apiURL = 'http://localhost:8080';

  static final AuthService _singleton = AuthService._internal();
  factory AuthService() {
    return _singleton;
  }
  AuthService._internal();

  Future<CredentialModel> login(
      {required String email, required String password}) async {
    Map<String, dynamic> loginheaders = {
      "email": email,
      "password": password,
    };

    final http.Response response =
        await http.post(Uri.parse('$apiURL/api/login'), body: loginheaders);
    Map<String, dynamic> reponsejson = jsonDecode(response.body);

    if (response.statusCode == 200) {
      CredentialModel creds = CredentialModel.fromJson(reponsejson);
      CredentialsService().creds = creds;
      return creds;
    }

    throw Exception(
        'Failed to load vehicles, error ${response.statusCode} : ${response.body}');
  }

  void logout() {
    CredentialsService().creds = null;
  }
}
