import 'dart:io' as Io;
import 'dart:typed_data';
import 'package:atd_app/Screens/Students.dart';
import 'package:atd_app/Screens/att_page.dart';
import 'package:atd_app/backend/userdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:mobile_scanner/mobile_scanner_web.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:developer';
import 'dart:convert';

class ResultScreen extends StatelessWidget {
  final String userId;

  const ResultScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(userId.toString())
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.exists) {
            // User data is available and document exists
            dynamic? userData = snapshot.data!.data();
            if (userData != null) {
              String userName = userData['Name'] ?? '';
              String userEmail = userData['Email-id'] ?? '';
              String userRollnum = userData['Rollnum'] ?? '';
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Name: $userName',
                      style: TextStyle(fontSize: 25, color: Colors.black)),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Email: $userEmail',
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Rollnumber: $userRollnum',
                      style: TextStyle(fontSize: 30, color: Colors.black)),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (Roll_List.contains(userRollnum.toString())) {
                        present.add(userRollnum);
                        Roll_List.remove(userRollnum.toString());
                      } else {
                        present.add(userRollnum);
                      }
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => sucAtd()));
                    },
                    child: Text('Mark Attendance ',
                        style: TextStyle(fontSize: 30, color: Colors.black)),
                  )
                ],
              );
            }
          }

          // Handle cases when data is not available or document doesn't exist
          return Text('User data not found');
        },
      ),
    );
  }
}

// class ResultScreen extends StatefulWidget {
//   final String code;
//   // final Function() closeScreen;
//   const ResultScreen({super.key, required this.code});

//   @override
//   State<ResultScreen> createState() => _ResultScreenState();
// }

// class _ResultScreenState extends State<ResultScreen> {
//   String? Name;
//   String? Phone;
//   String? Emailid;
//   String? Rollnum;
//   String? _uid;
//   @override
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   void initState() {
//     super.initState();
//     setState(() {
//       _uid = widget.code.toString();
//       print("the uid is " + _uid!);
//       getData();
//       setState(() {});
//     });
//   }

//   void getData() async {
//     final DocumentSnapshot userDoc =
//         await FirebaseFirestore.instance.collection('users').doc(_uid).get();

//     Name = userDoc.get('Name');
//     Emailid = userDoc.get('Email-id');
//     Phone = userDoc.get('Phone');
//     Rollnum = userDoc.get('Rollnum');
//     print("Name " + Name! + " " + Phone!);
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "Result Screen",
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         backgroundColor: Colors.teal,
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('users')
//             .doc(widget.code.toString())
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             // User data is available
//             Map<String, dynamic> userData =
//                 snapshot.data!.data() as Map<String, dynamic>;
//             String userName = userData['Name'] ?? 'name';
//             String userEmail = userData['Email-id'] ?? 'email';

//             return Column(
//               children: [
//                 Text('Name: $userName'),
//                 Text('Email: $userEmail'),
//               ],
//             );
//           } else if (snapshot.hasError) {
//             // Error in retrieving user data
//             return Text('Error: ${snapshot.error}');
//           } else {
//             // Loading user data
//             return CircularProgressIndicator();
//           }
//         },
//       ),
//     );
//   }
// }
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           page(Phone ?? "phone", Rollnum ?? "rollno", Name ?? "name"),
//           SizedBox(
//             height: 50,
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 if (Roll_List.contains(widget.code.toString())) {
//                   present.add(widget.code);
//                   Roll_List.remove(widget.code.toString());
//                 } else {
//                   present.add(widget.code);
//                 }
//                 // Fluttertoast.showToast(
//                 //   msg: "Attendance Marked",
//                 //   toastLength: Toast.LENGTH_SHORT,
//                 //   gravity: ToastGravity.CENTER,
//                 //   timeInSecForIosWeb: 1,
//                 //   backgroundColor: Colors.red,
//                 //   textColor: Colors.white,
//                 //   fontSize: 16.0,
//                 // );
//                 // print(present);
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => sucAtd()));
//               },
//               child: Text("MARK ATTENDANCE")),
//         ],
//       ),
//     );
//   }
// }

// Widget page(String phone, String rn, String name) {
//   return Container(
//     child: Padding(
//       padding: const EdgeInsets.only(left: 20),
//       child: Column(
//         children: [
//           Text(
//             "The Name of is $name",
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(
//             height: 8,
//           ),
//           Text(
//             "The Roll number of student is ${rn}",
//             style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(
//             height: 8,
//           ),
//           Text(
//             "The Phone number of student is $phone",
//             style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(
//             height: 8,
//           ),
//         ],
//       ),
//     ),
//   );
// }
