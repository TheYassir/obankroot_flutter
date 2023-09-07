import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:obankroot/bloc/auth/auth_bloc.dart';
import 'package:obankroot/routing/obankroot_router.dart';

class ObankrootAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const ObankrootAppBar({
    super.key,
    required this.title,
  });

  String _getCurrentRoute(BuildContext context) {
    return GoRouterState.of(context).uri.toString();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return AppBar(
          title: Row(
            children: [
              Text(title),
            ],
          ),
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () {
                if (_getCurrentRoute(context) != ObankrootRouter.preferences) {
                  context.push(ObankrootRouter.preferences);
                }
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(state.user!.name),
                  ),
                  const Icon(Icons.account_circle),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
