import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:obankroot/models/account_model.dart';
import 'package:obankroot/models/transaction_model.dart';
import 'package:obankroot/services/credentials_service.dart';

class AccountService {
  static String url = 'http://localhost:8080/api/me/accounts';
  static String token = CredentialsService().creds!.accesstoken;
  static String type = CredentialsService().creds!.tokentype;

  Future<List<AccountModel>> getAccounts() async {
    final http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': '$type $token'
      },
    );
    if (response.statusCode == 200) {
      List<AccountModel> accounts = jsonDecode(response.body)
          .map<AccountModel>((acc) => AccountModel.fromJson(acc))
          .toList();

      return accounts;
    } else {
      throw Exception(
          'Failed to load Accounts, error ${response.statusCode} : ${response.body}');
    }
  }

  Future<AccountModel> getOneAccount(int id) async {
    final http.Response response = await http.get(
      Uri.parse("$url/$id"),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': '$type $token'
      },
    );
    if (response.statusCode == 200) {
      AccountModel account = jsonDecode(response.body);
      return account;
    } else {
      throw Exception(
          'Failed to load Account id: $id, error ${response.statusCode} : ${response.body}');
    }
  }

  Future<List<TransactionModel>> getAccountTransaction(int fromid) async {
    final http.Response response = await http.get(
      Uri.parse("$url/$fromid/transactions"),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': '$type $token'
      },
    );
    if (response.statusCode == 200) {
      List<TransactionModel> transactions = jsonDecode(response.body)
          .map<TransactionModel>(
              (transac) => TransactionModel.fromJson(transac))
          .toList();
      return transactions;
    } else {
      throw Exception(
          'Failed to load Transactions fromid: $fromid, error ${response.statusCode} : ${response.body}');
    }
  }
}
