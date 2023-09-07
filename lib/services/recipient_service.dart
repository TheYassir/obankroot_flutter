import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:obankroot/models/recipient_model.dart';
import 'package:obankroot/services/credentials_service.dart';

class RecipientService {
  static String url = 'http://localhost:8080/api/me/recipients';
  static String token = CredentialsService().creds!.accesstoken;
  static String type = CredentialsService().creds!.tokentype;

  Future<List<RecipientModel>> getRecipients() async {
    final http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': '$type $token'
      },
    );
    if (response.statusCode == 200) {
      List<RecipientModel> recipients = jsonDecode(response.body)
          .map<RecipientModel>((recip) => RecipientModel.fromJson(recip))
          .toList();
      return recipients;
    } else {
      throw Exception(
          'Failed to load Recipients, error ${response.statusCode} : ${response.body}');
    }
  }

  Future<RecipientModel> getOneRecipient(int id) async {
    final http.Response response = await http.get(
      Uri.parse("$url/$id"),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': '$type $token'
      },
    );
    if (response.statusCode == 200) {
      RecipientModel recipient = jsonDecode(response.body);
      return recipient;
    } else {
      throw Exception(
          'Failed to load Recipient id: $id, error ${response.statusCode} : ${response.body}');
    }
  }

  Future deleteOneRecipient(int id) async {
    final http.Response response = await http.get(
      Uri.parse("$url/$id/delete"),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': '$type $token'
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> recipient = jsonDecode(response.body);
      print(recipient);
      return recipient;
    } else {
      throw Exception(
          'Failed to load Recipient id: $id, error ${response.statusCode} : ${response.body}');
    }
  }
}
