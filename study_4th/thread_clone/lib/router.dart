import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/common/main_navigation/main_navigation_screen.dart';
import 'package:thread_clone/constants/routes.dart';
import 'package:thread_clone/features/activity/activity_screen.dart';
import 'package:thread_clone/features/authentication/repos/authentication_repository.dart';
import 'package:thread_clone/features/authentication/views/create_account_screen.dart';
import 'package:thread_clone/features/authentication/views/sign_in_screen.dart';
import 'package:thread_clone/features/home/home_screen.dart';
import 'package:thread_clone/features/privacy/privacy_screen.dart';
import 'package:thread_clone/features/profile/profile_screen.dart';
import 'package:thread_clone/features/search/search_screen.dart';
import 'package:thread_clone/features/settings/views/settings_screen.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: Routes.home.path,
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;

      if (!isLoggedIn) {
        if (state.fullPath != Routes.signIn.path &&
            state.fullPath != Routes.signUp.path) {
          return Routes.signUp.path;
        }
      }
      return null;
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainNavigationScreen(child: child);
        },
        routes: [
          GoRoute(
            path: Routes.home.path,
            name: Routes.home.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomeScreen(),
            ),
          ),
          GoRoute(
            path: Routes.search.path,
            name: Routes.search.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SearchScreen(),
            ),
          ),
          GoRoute(
            path: Routes.activity.path,
            name: Routes.activity.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ActivityScreen(),
            ),
          ),
          GoRoute(
            path: Routes.profile.path,
            name: Routes.profile.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileScreen(),
            ),
          ),
          GoRoute(
            path: Routes.settings.path,
            name: Routes.settings.name,
            builder: (context, state) => const SettingsScreen(),
          ),
          GoRoute(
            path: Routes.privacy.path,
            name: Routes.privacy.name,
            builder: (context, state) => const PrivacyScreen(),
          ),
        ],
      ),
      GoRoute(
        path: Routes.signIn.path,
        name: Routes.signIn.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SignInScreen(),
        ),
      ),
      GoRoute(
        path: Routes.signUp.path,
        name: Routes.signUp.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: CreateAccountScreen(),
        ),
      ),
    ],
  );
});
