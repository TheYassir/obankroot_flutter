import 'package:go_router/go_router.dart';
import 'package:obankroot/models/user_model.dart';
import 'package:obankroot/pages/detail_account.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/preferences_page.dart';
import '../pages/account_page.dart';
import '../pages/recipients_page.dart';
import '../pages/transfer_page.dart';

class ObankrootRouter {
  static const String home = '/';
  static const String login = '/login';
  static const String preferences = '/preferences';
  static const String account = '/account';
  static const String detailaccount = 'detail';
  static const String recipients = '/recipients';
  static const String transfer = '/transfer';

  static final GoRouter router = GoRouter(
    initialLocation: login,
    routes: [
      GoRoute(
        path: login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: preferences,
        builder: (context, state) => const PreferencesPage(),
      ),
      GoRoute(
          path: account,
          builder: (context, state) {
            UserModel user = state.extra as UserModel;
            return AccountPage(userId: user.id);
          },
          routes: [
            GoRoute(
              path: detailaccount,
              builder: (context, state) {
                UserModel user = state.extra as UserModel;
                return DetailAccountPage(userId: user.id);
              },
            ),
          ]),
      GoRoute(
        path: recipients,
        builder: (context, state) {
          UserModel user = state.extra as UserModel;
          return RecipientsPage(userId: user.id);
        },
      ),
      GoRoute(
        path: transfer,
        builder: (context, state) => TransferPage(),
      ),
    ],
  );
}
