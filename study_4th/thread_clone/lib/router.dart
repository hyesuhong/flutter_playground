import 'package:go_router/go_router.dart';
import 'package:thread_clone/common/main_navigation/main_navigation_screen.dart';
import 'package:thread_clone/features/activity/activity_screen.dart';
import 'package:thread_clone/features/home/home_screen.dart';
import 'package:thread_clone/features/privacy/privacy_screen.dart';
import 'package:thread_clone/features/profile/profile_screen.dart';
import 'package:thread_clone/features/search/search_screen.dart';
import 'package:thread_clone/features/settings/views/settings_screen.dart';

final router = GoRouter(
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
  ],
);
