part of 'account_bloc.dart';

sealed class AccountEvent {
  const AccountEvent();
}

class LoadAccountsEvent extends AccountEvent {
  final int? userId;
  const LoadAccountsEvent({this.userId});
}
