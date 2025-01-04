import 'package:fe_nike/core/constants/theme.dart';
import 'package:fe_nike/features/change_favorite_product/presentation/bloc/bloc.dart';
import 'package:fe_nike/features/favorites/favorite_products/presentation/bloc/get_favorite_products/bloc.dart';
import 'package:fe_nike/features/favorites/favorite_products/presentation/bloc/get_favorite_products/event.dart';
import 'package:fe_nike/features/profile/me/presentation/bloc/me_bloc.dart';
import 'package:fe_nike/features/profile/me/presentation/bloc/me_events.dart';
import 'package:fe_nike/util/theme_manager.dart';
import 'package:fe_nike/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:fe_nike/features/home/products/presentation/bloc/product_bloc.dart';
import 'package:fe_nike/features/home/products/presentation/bloc/product_event.dart';
import 'package:fe_nike/injection_container.dart';
import 'package:fe_nike/util/auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:fe_nike/helper/custom_navigation_helper.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  // setup light mode if no mode chosen
  int ? mode =  locator<SharedPreferences>().getInt('mode');
  if(mode == null){
    locator<SharedPreferences>().setInt('mode', 0);
  }
  if (AuthManager.isLogin()) {
    CustomNavigationHelper(CustomNavigationHelper.homePath);
  } else {
    CustomNavigationHelper(CustomNavigationHelper.homeAuthPath);
  }

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    systemStatusBarContrastEnforced: false
  ));

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeManager(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeManager _themeManager;
  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    _themeManager = Provider.of<ThemeManager>(context, listen: false);
    _themeMode = _themeManager.themeMode;
    _themeManager.addListener(changeThemeMode);
  }

  @override
  void dispose() {
    _themeManager.removeListener(changeThemeMode);
    super.dispose();
  }

  void changeThemeMode() {
    setState(() {
      _themeMode = _themeManager.themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (BuildContext context) => locator<ProductBloc>()..add(const GetProduct()),
        ),
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => locator<AuthBloc>(),
        ),
        BlocProvider<MeBloc>(
          create: (BuildContext context) => locator<MeBloc>()..add(const GetMeEvent()),
        ),
        BlocProvider<GetFavoriteStateBloc>(
            create: (BuildContext context) => locator<GetFavoriteStateBloc>()
        ),
        BlocProvider<FavoriteProductBloc>(
            create: (BuildContext context) => locator<FavoriteProductBloc>()..add(const GetFavoriteProduct())
        ),
        
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: _themeMode,
        darkTheme: darkTheme,
        theme: lightTheme,
        routerConfig: CustomNavigationHelper.router,
        builder: (context, router) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: router!,
            ),
          );
        },
      ),
    );
  }
}
