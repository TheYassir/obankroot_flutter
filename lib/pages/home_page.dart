import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obankroot/bloc/auth/auth_bloc.dart';
import 'package:obankroot/components/obankroot_appbar.dart';
import 'package:obankroot/components/obankroot_bottom_navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const ObankrootAppBar(
            title: 'Home',
          ),
          bottomNavigationBar: const ObankrootBottomNavBar(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome ${state.user!.name} !',
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Use the navigation bar to go to your accounts or to transfer money.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
