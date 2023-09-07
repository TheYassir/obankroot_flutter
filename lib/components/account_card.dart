import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:obankroot/bloc/auth/auth_bloc.dart';
import '../models/account_model.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({super.key, required this.account});
  final AccountModel account;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.push("/account/detail", extra: state.user);
          },
          child: Card(
            child: ListTile(
              title: Text(account.name),
              trailing: Text(
                  '${double.parse((account.balance / 100).toStringAsFixed(3))} €'),
            ),
          ),
        );
      },
    );
  }
}
