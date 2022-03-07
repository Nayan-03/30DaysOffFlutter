// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_application_1/widgets/navigation_drawer_widget.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_application_1/widgets/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "catalog";

  final Url = "https://mocki.io/v1/1dac0383-796b-4524-9a25-fe802a8bc89f";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    // final catalogjson =
    //     await rootBundle.loadString("assets/files/catalog.json");

    final response = await http.get(Uri.parse(Url));
    final catalogjson = response.body;
    final decodedData = jsonDecode(catalogjson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return 
    // DefaultTabController(
    //   length: 4,
    //   child:
       Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.red],
              ),
            ),
          ),
          elevation: 20,
          title: const Text("Catalog App", style: TextStyle(fontSize: 25),),
          iconTheme: const IconThemeData(color: Colors.white),
          titleSpacing: 20,
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {CatalogModel.items;}),
            IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {}),
          ],
        ),
        drawer: const NavigationDrawerWidget(),
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: const {AddMutation, RemoveMutation},
          builder: (context, store, status) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            backgroundColor: context.theme.buttonColor,
            child: const Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
          ).badge(
              color: Vx.gray200,
              size: 22,
              count: _cart.items.length,
              textStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
        ),
        body: SafeArea(
          child: Container(
            color: MyTheme.creaamColor,
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              // child: Column(
              children:[ const CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                const CatalogList().py16().expand()
              else
                const CircularProgressIndicator().centered().expand(),

              // Container(
              //   padding: EdgeInsets.all(10),
              //   margin: EdgeInsets.all(5),
              //   alignment: Alignment.center,
              //   constraints: BoxConstraints.expand(height: 50),
              //   child: imageSlider(context),

            ],
          ),
        ),
      ),
    );
  }

 

}