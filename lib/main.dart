import 'package:fe_nike/core/constants/colors.dart';
import 'package:fe_nike/core/constants/font_size.dart';
import 'package:fe_nike/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:fe_nike/features/authentication/presentation/pages/home_auth.dart';
import 'package:fe_nike/features/home/products/presentation/bloc/product_bloc.dart';
import 'package:fe_nike/features/home/products/presentation/bloc/product_event.dart';
import 'package:fe_nike/injection_container.dart';
import 'package:fe_nike/util/auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:fe_nike/helper/custom_navigation_helper.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  CustomNavigationHelper.instance;
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light
  ));
  print('isLogin ${AuthManager.isLogin()}');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (BuildContext context) => locator()..add(const GetProduct() )
        ),
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => locator()
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          color: Colors.white,
          child: AuthManager.isLogin() ?  CustomRouter() :  HomeAuth() ,
        ),
        theme: ThemeData(
          useMaterial3: true
        ),
      ),
    );
  }
}

class CustomRouter extends StatelessWidget {
  const CustomRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: CustomNavigationHelper.router,
      debugShowCheckedModeBanner: false,
      builder: (context, router) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: router!,
          ),
        );
      },
    );
  }
}
