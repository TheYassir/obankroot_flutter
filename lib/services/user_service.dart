import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:obankroot/services/credentials_service.dart';

import '../models/user_model.dart';

class UserService {
  static String url = 'http://localhost:8080/api/me';
  static String token = CredentialsService().creds!.accesstoken;
  static String type = CredentialsService().creds!.tokentype;

  Future<UserModel> getUser() async {
    final http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': '$type $token'
      },
    );

    Map<String, dynamic> reponsejson = jsonDecode(response.body);

    if (response.statusCode == 200) {
      UserModel user = UserModel.fromJson(reponsejson);

      return user;
    } else {
      throw Exception(
          'Failed to load User, error ${response.statusCode} : ${response.body}');
    }
  }
}
