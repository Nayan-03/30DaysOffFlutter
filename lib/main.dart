import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/navigation_provider.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(
    store: MyStore(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
    ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context), 
        debugShowCheckedModeBanner: false,
        initialRoute: MyRoutes.homeRoute,
        routes: {
          "/": (context) => const LoginPage(),
          MyRoutes.homeRoute: (context) => const HomePage(),
          MyRoutes.loginRoute: (context) => const LoginPage(),
          MyRoutes.cartRoute: (context) => const CartPage(),
          MyRoutes.profileRoute: (context) => const ProfilePage(),
        },
      ),
    );
  }
