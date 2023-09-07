import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obankroot/bloc/account/account_bloc.dart';
import 'package:obankroot/components/obankroot_appbar.dart';
import 'package:obankroot/components/obankroot_bottom_navbar.dart';

class DetailAccountPage extends StatelessWidget {
  const DetailAccountPage({super.key, required this.userId});

  final int userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AccountBloc()..add(LoadAccountsEvent(userId: userId)),
      child: const Scaffold(
        appBar: ObankrootAppBar(
          title: 'Account',
        ),
        bottomNavigationBar: ObankrootBottomNavBar(),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('ACCOOUNT DETAIL'),
              ],
            )),
      ),
    );
  }
}
