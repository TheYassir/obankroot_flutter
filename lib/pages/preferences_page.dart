import 'package:flutter/material.dart';
import 'package:obankroot/bloc/auth/auth_bloc.dart';
import 'package:obankroot/components/obankroot_bottom_navbar.dart';
import 'package:go_router/go_router.dart';

import '../components/obankroot_appbar.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/theme/theme_bloc.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ObankrootAppBar(
        title: 'My Preferences',
      ),
      bottomNavigationBar: const ObankrootBottomNavBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Dark Mode'),
                BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (context, state) {
                    return Checkbox(
                      checkColor: Colors.white,
                      value: state.isDarkMode,
                      onChanged: (value) {
                        ThemeBloc themeBloc = context.read<ThemeBloc>();
                        themeBloc.add(ThemeToggleEvent());
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(LogoutEvent());
                    context.go("/login");
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                  ),
                  child: const Text('Logout'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
