import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:obankroot/bloc/auth/auth_bloc.dart';
import 'package:obankroot/bloc/theme/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ObankrootBottomNavBar extends StatelessWidget {
  const ObankrootBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, statetheme) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return BottomNavigationBar(
              currentIndex: statetheme.navbarIndex,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.white,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  backgroundColor: Color.fromRGBO(113, 28, 204, 1),
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Color.fromRGBO(113, 28, 204, 1),
                  icon: Icon(Icons.account_balance_wallet),
                  label: 'Account',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Color.fromRGBO(113, 28, 204, 1),
                  icon: Icon(Icons.people),
                  label: 'Recipients',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Color.fromRGBO(113, 28, 204, 1),
                  icon: Icon(Icons.compare_arrows_outlined),
                  label: 'Transfer',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Color.fromRGBO(113, 28, 204, 1),
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
              onTap: (index) {
                context
                    .read<ThemeBloc>()
                    .add(NavbarIndexEvent(navbarIndex: index));

                switch (index) {
                  case 0:
                    context.go("/");
                    break;
                  case 1:
                    context.go("/account", extra: state.user);
                    break;
                  case 2:
                    context.go("/recipients", extra: state.user);
                    break;
                  case 3:
                    context.go("/transfer");
                    break;
                  case 4:
                    context.go("/preferences");
                    break;
                }
              },
            );
          },
        );
      },
    );
  }
}
