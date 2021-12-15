 import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);
  final int days = 30;
  final String name = "Chats";

  get child => null;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
        body: Center(
          child: Container(
          child: Text("Welcome to $days days of flutter by $name"),
        ),
        ),
        drawer: const MyDrawer(),

    );
  }
}