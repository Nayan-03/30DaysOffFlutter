// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      //shape: const StadiumBorder(),

      child: ListTile(
        onTap: () { 
          print("${item.name} pressed"); 
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1.5,
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
