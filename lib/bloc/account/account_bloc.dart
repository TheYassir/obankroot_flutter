import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/account_model.dart';
import '../../services/account_service.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(const AccountState(accounts: [])) {
    on<LoadAccountsEvent>((event, emit) async {
      List<AccountModel> accounts = await AccountService().getAccounts();
      accounts =
          accounts.where((account) => account.userId == event.userId).toList();
      emit(state.copyWith(accounts: accounts));
    });
  }
}
