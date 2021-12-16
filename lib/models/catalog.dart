class CatalogModel {
 static final items = [
  Item(
    id: 1,
    name: "iPhone 12 Pro",
    desc: "Apple iPhone 12th generatopn",
    price: 999,
    color: "#00008B",
    image: "https://photos5.appleinsider.com/gallery/38573-73428-iPhone-12-Pro-Blue-Angle-xl.jpg",
    ),
  ]; 
}





class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});

} 
