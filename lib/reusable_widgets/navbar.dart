// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter/material.dart';
// import '/Screens/aboutus.dart';

// import '/backend/add_sponsor.dart';
// import '/backend/display_sponsors.dart';
// import '/Screens/signin.dart';

// class NavBar extends StatefulWidget {
//   const NavBar({super.key});

//   @override
//   State<NavBar> createState() => _NavBarState();
// }

// class _NavBarState extends State<NavBar> {
//   @override
//     Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           DrawerHeader(
//             child: Text(
//               'MENU',
//               style: TextStyle(color: Colors.white, fontSize: 25),
//             ),
//             decoration: BoxDecoration(
            
//                 color: Colors.purple,
//                 image: DecorationImage(
//                     fit: BoxFit.fill,
//                     image: AssetImage('assets/images/logo2.jpg'))
//                     ),
//           ),
//           ListTile(
//             leading: Icon(Icons.input),
//             title: Text('HOME'),
//             onTap: () => {Navigator.of(context).pop()},
//           ),
//           ListTile(
//             leading: Icon(Icons.handshake_sharp),
//             title: Text('SPONSORSHIPS'),
//             onTap: () => {Navigator.push(context,MaterialPageRoute(builder: (context) => displaySponsor()))},
//           ),
//           ListTile(
//             leading: Icon(Icons.currency_rupee),
//             title: Text('ADD SPONSORSHIP'),
//             // onTap: () => {Navigator.push(context,MaterialPageRoute(builder: (context) => addSponsor()))},
//           ),
//           ListTile(
//             leading: Icon(Icons.verified_user),
//             title: Text('ABOUT US'),
//             onTap: () =>{Navigator.push(context,MaterialPageRoute(builder: (context) => aboutUs()))},
//           ),
//           SizedBox(height: 280,),
//           ListTile(
//             leading: Icon(Icons.exit_to_app),
//             title: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text('LOGOUT'),
//             ),
//             onTap: () => {Navigator.push(context,MaterialPageRoute(builder: (context) => SignInScreen()))},
//           ),
//         ],
//       ),
//     );
//   }
  
// }