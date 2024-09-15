import 'package:fe_nike/features/home/slide_products/presentation/pages/view_all.dart';
import 'package:fe_nike/screens/bag.dart';
import 'package:fe_nike/screens/favourite.dart';
import 'package:fe_nike/screens/home.dart';
import 'package:fe_nike/screens/profile.dart';
import 'package:fe_nike/screens/shop.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../util/my_bottom_navigation_bar.dart';

class CustomNavigationHelper {
  static final CustomNavigationHelper _instance = CustomNavigationHelper._internal();

  static CustomNavigationHelper get instance => _instance;

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey =
  GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> homeTabNavigatorKey =
  GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> shopTabNavigatorKey =
  GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> favoriteTabNavigatorKey =
  GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> bagTabNavigatorKey =
  GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> profileTabNavigatorKey =
  GlobalKey<NavigatorState>();

  BuildContext get context => router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser => router.routeInformationParser;


  static const String rootDetailPath = '/rootDetail';

  //tab
  static const String homePath = '/home';
  static const String shopPath = '/shop';
  static const String favouritePath = '/favourite';
  static const String bagPath= '/bag';
  static const String profilePath = '/profile';

  //pages path
  static const String signUpPath = '/signUp';
  static const String signInPath = '/signIn';

  static const String viewAllSlideProductPage = 'viewAllSlideProductPagePath';

  factory CustomNavigationHelper() {
    return _instance;
  }

  CustomNavigationHelper._internal() {
    final routes = [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            navigatorKey: homeTabNavigatorKey,
            routes: [
              GoRoute(
                path: homePath,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const HomeScreen(),
                    state: state,
                  );
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: viewAllSlideProductPage,
                    pageBuilder: (context, GoRouterState state){
                      return getPage(
                        child: ViewAll(),
                        state: state
                      );
                    }
                  )
                ]
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shopTabNavigatorKey,
            routes: [
              GoRoute(
                path: shopPath,
                pageBuilder: (context, state) {
                  return getPage(
                    child: const ShopScreen(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: favoriteTabNavigatorKey,
            routes: [
              GoRoute(
                path: favouritePath,
                pageBuilder: (context, state) {
                  return getPage(
                    child: const FavoriteScreen(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: bagTabNavigatorKey,
            routes: [
              GoRoute(
                  path: bagPath,
                  pageBuilder: (context, state) {
                    return getPage(
                      child: const BagScreen(),
                      state: state,
                    );
                  },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: profileTabNavigatorKey,
            routes: [
              GoRoute(
                path: profilePath,
                pageBuilder: (context, state) {
                  return getPage(
                    child: const ProfileScreen(),
                    state: state,
                  );
                },
              ),
            ],
          ),
        ],
        pageBuilder: (
            BuildContext context,
            GoRouterState state,
            StatefulNavigationShell navigationShell
            ) {
          return getPage(
            child: MyBottomNavigationBar(
              child: navigationShell,
            ),
            state: state,
          );
        },
      ),
    ];

    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: homePath,
      routes: routes,
    );
  }

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return CustomTransitionPage(
      child: child,
      key: state.pageKey,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
    );
  }
}