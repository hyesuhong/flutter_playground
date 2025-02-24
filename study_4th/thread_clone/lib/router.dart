import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/common/main_navigation/main_navigation_screen.dart';
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
    initialLocation: '/',
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;

      if (!isLoggedIn) {
        if (state.fullPath != "/sign-in" &&
            state.fullPath != "/create-account") {
          return "/create-account";
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
            path: '/',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomeScreen(),
            ),
          ),
          GoRoute(
            path: '/search',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SearchScreen(),
            ),
          ),
          GoRoute(
            path: '/activity',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ActivityScreen(),
            ),
          ),
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileScreen(),
            ),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsScreen(),
            routes: [
              GoRoute(
                path: 'privacy',
                builder: (context, state) => const PrivacyScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/sign-in',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SignInScreen(),
        ),
      ),
      GoRoute(
        path: '/create-account',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: CreateAccountScreen(),
        ),
      ),
    ],
  );
});
