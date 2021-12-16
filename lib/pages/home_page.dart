 import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/drawer.dart';

//* Day 11 we learned about context, constraints

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);
  final int days = 30;
  final String name = "Chats";

  get child => null;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App",
        textScaleFactor: 1.4,
        ),
      ),
        body: Center(
          child: Text("Welcome to $days days of flutter by $name"),
      ),
        drawer: const MyDrawer(),
    );
  }
}