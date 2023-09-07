import 'package:flutter/material.dart';
import 'package:obankroot/bloc/auth/auth_bloc.dart';

import './routing/obankroot_router.dart';
import './utils/obankroot_theme.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/theme/theme_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                backgroundColor: Color.fromRGBO(113, 28, 204, 1),
              ),
              // Ici, nous avons choisi de définir un thème à part dans un
              // répertoire utils afin de le rendre facilement réutilisable
              // et modifiable dans toute notre application.
              colorScheme: state.isDarkMode
                  ? ObankrootTheme.colorSchemeDark
                  : ObankrootTheme.colorScheme,
            ),
            routerConfig: ObankrootRouter.router,
          );
        },
      ),
    );
  }
}
