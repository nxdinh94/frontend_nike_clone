import 'package:fe_nike/features/authentication/presentation/pages/email_page.dart';
import 'package:fe_nike/features/authentication/presentation/pages/home_auth.dart';
import 'package:fe_nike/features/authentication/presentation/pages/signin/password_signin.dart';
import 'package:fe_nike/features/authentication/presentation/pages/signup/password_signup.dart';
import 'package:fe_nike/features/home/products/domain/entites/products.dart';
import 'package:fe_nike/features/home/products/presentation/pages/view_all.dart';
import 'package:fe_nike/features/product_detail/presentation/pages/home_product_detail.dart';
import 'package:fe_nike/features/profile/me/presentation/pages/update_profile.dart';
import 'package:fe_nike/screens/bag.dart';
import 'package:fe_nike/screens/favourite.dart';
import 'package:fe_nike/screens/home.dart';
import 'package:fe_nike/screens/profile.dart';
import 'package:fe_nike/screens/shop.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../util/my_bottom_navigation_bar.dart';

class CustomNavigationHelper {


  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> homeTabNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> shopTabNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> favoriteTabNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> bagTabNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> profileTabNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> authTabNavigatorKey = GlobalKey<NavigatorState>();

  BuildContext get context => router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser => router.routeInformationParser;

  static const String rootDetailPath = '/rootDetail';

  // Tab paths
  static const String homePath = '/home';
  static const String shopPath = '/shop';
  static const String favouritePath = '/favourite';
  static const String bagPath= '/bag';
  static const String profilePath = '/profile';

  // Page paths
  static const String homeAuthPath = '/homeAuth';
  static const String signUpPath = 'signUp';
  static const String signInPath = 'signIn';
  static const String passwordSignInPath = 'passwordSignIn';
  static const String passwordSignUpPath = 'passwordSignUp';

  static const String viewAllSlideProductPage = 'viewAllSlideProductPagePath';

  //profile child path
  static const String updateProfilePath = 'updateProfile';

  //Product detail path
  static const String homeProductDetailPath = '/homeProductDetail';


  CustomNavigationHelper._internal();
  static final CustomNavigationHelper _instance = CustomNavigationHelper._internal();//instance of CustomNavigatorHelper
  static CustomNavigationHelper get instance => _instance;
  factory CustomNavigationHelper(String initialRoute) {
    return _instance._initialize(initialRoute);
  }


  CustomNavigationHelper _initialize(String initialRoute) {
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
                    ),

                  ]
              ),
              //Product detail
              GoRoute(
                  path: homeProductDetailPath,
                  pageBuilder: (context, GoRouterState state){
                    ProductEntity product = state.extra as ProductEntity;
                    return getPage(
                        child: HomeProductDetail(
                          productEntity: product,
                        ),
                        state: state
                    );
                  }
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
                routes: <RouteBase>[
                  GoRoute(
                    path: CustomNavigationHelper.updateProfilePath,
                    pageBuilder: (context, state) {
                      return getPage(
                        child: UpdateProfile(),
                        state: state
                      );
                    },
                  )
                ]
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
            child:  MyBottomNavigationBar(child: navigationShell), // Show it elsewhere
            state: state,
          );
        },
      ),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            navigatorKey: authTabNavigatorKey,
            routes: [
              GoRoute(
                path: CustomNavigationHelper.homeAuthPath,
                pageBuilder: (context, state) {
                  return getPage(
                    child: const HomeAuth(),
                    state: state,
                  );
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: CustomNavigationHelper.signInPath,
                    pageBuilder: (context, state) {
                      String fromRequest = state.extra as String;
                      return getPage(
                        child: EmailPage(fromRequest: fromRequest,),
                        state: state,
                      );
                    },
                  ),
                  GoRoute(
                    path: CustomNavigationHelper.signUpPath,
                    pageBuilder: (context, state) {
                      String fromRequest = state.extra as String;
                      return getPage(
                        child: EmailPage(fromRequest: fromRequest),
                        state: state,
                      );
                    },
                  ),
                  GoRoute(
                    path: CustomNavigationHelper.passwordSignInPath,
                    pageBuilder: (context, state){
                      String email = state.extra as String;
                      return getPage(
                        child: PasswordSignin(email: email),
                        state: state
                      );
                    }
                  ),
                  GoRoute(
                    path: CustomNavigationHelper.passwordSignUpPath,
                    pageBuilder: (context, state){
                      Map<String, dynamic> data = state.extra as Map<String, dynamic>;
                      return getPage(
                        child: PasswordSignup(
                          email: data['email'],
                          country: data['country']
                        ),
                        state: state
                      );
                    }
                  ),

                ]
              ),
          ],
      )
        ],
        pageBuilder: (
            BuildContext context,
            GoRouterState state,
            StatefulNavigationShell navigationShell
            ) {
          return getPage(
            child:  navigationShell, // Show it elsewhere
            state: state,
          );
        },

      )
    ];

    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: initialRoute,
      routes: routes,
    );
    return this;
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
