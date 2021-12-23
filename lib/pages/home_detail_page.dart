
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) 
  : assert (catalog != null),
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent),
      backgroundColor: MyTheme.creaamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor,),
                shape: MaterialStateProperty.all(const StadiumBorder())),
              child: "Add to cart".text.make(),
            ).wh(120, 50),
          ],
        ).p32(),
      ),
      body: SafeArea(
          bottom: false,
          child: Column(
          children: [
            Hero(
               tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4
                    .color(MyTheme.darkBluishColor)
                    .bold.make(),
                    catalog.desc.text.xl.make(),
                    10.heightBox,
                    "Dolor dolor dolores at sit et consetetur sanctus est rebum no, stet amet sadipscing aliquyam stet sadipscing sanctus diam sed est, takimata dolor nonumy ipsum dolor duo. Sed lorem stet rebum aliquyam labore dolor et kasd dolor, sadipscing dolore aliquyam labore duo et sed est gubergren tempor. Dolore sea et."
                    .text.xs.make().p16(),
                  ],
                ).py64(),
              ),
            )),
          ],
        ).py16(),
      ),
    );
  }
}
