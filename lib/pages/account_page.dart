import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obankroot/bloc/account/account_bloc.dart';
import 'package:obankroot/components/obankroot_bottom_navbar.dart';
import '../components/obankroot_appbar.dart';
import '../components/account_card.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key, required this.userId});

  final int userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AccountBloc()..add(LoadAccountsEvent(userId: userId)),
      child: Scaffold(
        appBar: const ObankrootAppBar(
          title: 'Account',
        ),
        bottomNavigationBar: const ObankrootBottomNavBar(),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<AccountBloc, AccountState>(
                      builder: (context, state) {
                    return ListView.builder(
                        itemCount: state.accounts.length,
                        itemBuilder: (context, index) {
                          return AccountCard(account: state.accounts[index]);
                        });
                  }),
                )
              ],
            )),
      ),
    );
  }
}
