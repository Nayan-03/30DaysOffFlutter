// import 'package:flutter/material.dart';

// class MyDrawer extends StatelessWidget {
//   const MyDrawer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const imageUrl =
//         "https://png.pngtree.com/png-vector/20190710/ourmid/pngtree-user-vector-avatar-png-image_1541962.jpg";
//     return Drawer(
//       child: Container(
//         // color: Colors.deepPurple,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//           colors: [Colors.purple, Colors.red],
//           ),
//         ),
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: const [
//             DrawerHeader(
//               padding: EdgeInsets.zero,
//               child: UserAccountsDrawerHeader(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Colors.purple, Colors.red],
//                     ),
//                 ),
//                 margin: EdgeInsets.zero,
//                 accountName: Text("Nayan Moradiya", style: TextStyle(color: Colors.white),),
//                 accountEmail: Text("nayan@gmail.com", style: TextStyle(color: Colors.white),),
//                 currentAccountPicture: CircleAvatar(
//                   backgroundImage: NetworkImage(imageUrl),
                  
//                 ),
//               ),
//             ),
            
//             ListTile(
//               leading: Icon(
//                 Icons.person,
//                 color: Colors.white,
//               ),
//               title: Text(
//                 "Profile",
//                 textScaleFactor: 1.2,
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//              ListTile(
//               leading: Icon(
//                 Icons.lock,
//                 color: Colors.white,
//               ),
//               title: Text(
//                 "LogOut",
//                 textScaleFactor: 1.2,
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
