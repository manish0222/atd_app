
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../utils/color_utils.dart';

// class displaySponsor extends StatefulWidget {
//   const displaySponsor({super.key});

//   @override
//   State<displaySponsor> createState() => _displaySponsorState();
// }

// class _displaySponsorState extends State<displaySponsor> {
//   String email = 'knj621311@gmail.com';
//   String body = '';
//  // String subject = 'Sponsor';
//   @override
//   Widget build(BuildContext context) {
//        return Scaffold(
//         extendBodyBehindAppBar: true,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           title: const Text("AVAILABLE SPONSORS", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
//         ),
//         floatingActionButton: null,
//         body: 
//         Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(colors: [
//             hexStringToColor("CB2B93"),
//             hexStringToColor("9546C4"),
//             hexStringToColor("5E61F4"),
//             ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
//           ),
//           child: 
//           StreamBuilder(
//             stream: FirebaseFirestore.instance.collection("Sponsors").snapshots(),
//             builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
//               if(!snapshot.hasData){
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               return ListView(

//                 children: snapshot.data!.docs.map((e) => Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Card(
//                     elevation: 1,
//                     color: Colors.lightBlue.withOpacity(0.5),
//                     child: ListTile(
//                       onTap: () =>launchUrl(Uri.parse('mailto:$email?subject=Sponsor : ${e['Company']}&body=')),
//                       contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                       leading: CircleAvatar(backgroundColor: Colors.green),
//                       title: Text(e['Company'],style: TextStyle(fontSize: 26),),
//                       trailing: Text("Rs. ${e['Amount']}",style: TextStyle(fontSize: 18),),
//                       ),
//                   ),
//                 ),
//                   ).toList()
//               );
//             },
//           ),),
//         );
// //     );
//   }
// }