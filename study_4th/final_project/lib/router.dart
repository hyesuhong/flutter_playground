import 'package:final_project/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: Routes.home.path,
  routes: [
    GoRoute(
      path: Routes.home.path,
      name: Routes.home.name,
      builder: (context, state) => Scaffold(
        body: Center(
          child: Text(Routes.home.name),
        ),
      ),
    ),
  ],
);
