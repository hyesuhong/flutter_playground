import 'package:go_router/go_router.dart';
import 'package:thread_clone/common/main_navigation/main_navigation_screen.dart';
import 'package:thread_clone/features/activity/activity_screen.dart';
import 'package:thread_clone/features/home/home_screen.dart';
import 'package:thread_clone/features/privacy/privacy_screen.dart';
import 'package:thread_clone/features/profile/profile_screen.dart';
import 'package:thread_clone/features/search/search_screen.dart';
import 'package:thread_clone/features/settings/settings_screen.dart';

final router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainNavigationScreen(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: '/activity',
          builder: (context, state) => const ActivityScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
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
