import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(
    store: MyStore(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context), 
      debugShowCheckedModeBanner: false,
      initialRoute: MyRouts.homeRoute,
      routes: {
        "/": (context) => const LoginPage(),
        MyRouts.homeRoute: (context) => const HomePage(),
        MyRouts.loginRoute: (context) => const LoginPage(),
        MyRouts.cartRoute: (context) => const CartPage()
      },
    );
  }
}
