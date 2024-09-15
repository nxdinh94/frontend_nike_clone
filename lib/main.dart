import 'package:fe_nike/core/constants/colors.dart';
import 'package:fe_nike/core/constants/font_size.dart';
import 'package:flutter/material.dart';
import 'package:fe_nike/helper/custom_navigation_helper.dart';
import 'package:flutter/services.dart';
void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  CustomNavigationHelper.instance;
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.white,
        child: SafeArea(
          child: CustomRouter(),
        ),
      ),
      theme: ThemeData(
        useMaterial3: true
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
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: router!,
        );
      },
    );
  }
}
