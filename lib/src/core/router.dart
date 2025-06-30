import 'dart:io';

import 'package:go_router/go_router.dart';

import '../features/actions/screens/read_screen.dart';
import '../features/home/screens/home_screen.dart';
import '../features/onboard/screens/onboard_screen.dart';
import '../features/settings/screens/faq_screen.dart';
import '../features/settings/screens/search_screen.dart';
import '../features/splash/screens/splash_screen.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: OnboardScreen.routePath,
      builder: (context, state) => const OnboardScreen(),
    ),
    GoRoute(
      path: HomeScreen.routePath,
      builder: (context, state) => const HomeScreen(),
    ),

    // actions
    GoRoute(
      path: ReadScreen.routePath,
      builder: (context, state) => ReadScreen(
        file: state.extra as File,
      ),
    ),

    // settings
    GoRoute(
      path: SearchScreen.routePath,
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: FaqScreen.routePath,
      builder: (context, state) => const FaqScreen(),
    ),
  ],
);
