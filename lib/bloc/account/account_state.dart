part of 'account_bloc.dart';

class AccountState extends Equatable {
  final List<AccountModel> accounts;

  const AccountState({required this.accounts});

  AccountState copyWith({List<AccountModel>? accounts}) {
    return AccountState(
      accounts: accounts ?? this.accounts,
    );
  }

  @override
  List<Object?> get props => [
        accounts,
      ];

  @override
  String toString() {
    return 'AccountState{accounts: $accounts}';
  }
}
