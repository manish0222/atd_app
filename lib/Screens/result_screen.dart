import 'dart:io' as Io;
import 'dart:typed_data';
import 'package:atd_app/Screens/Students.dart';
import 'package:atd_app/Screens/att_page.dart';
import 'package:atd_app/backend/userdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:mobile_scanner/mobile_scanner_web.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:developer';
import 'dart:convert';

class ResultScreen extends StatelessWidget {
  final String code;
  // final Function() closeScreen;
  const ResultScreen({super.key, required this.code});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Result Screen",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          page(code),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                if (Roll_List.contains(code.toString())) {
                  present.add(code);
                  Roll_List.remove(code.toString());
                } else {
                  present.add(code);
                }
                // Fluttertoast.showToast(
                //   msg: "Attendance Marked",
                //   toastLength: Toast.LENGTH_SHORT,
                //   gravity: ToastGravity.CENTER,
                //   timeInSecForIosWeb: 1,
                //   backgroundColor: Colors.red,
                //   textColor: Colors.white,
                //   fontSize: 16.0,
                // );
                // print(present);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => sucAtd()));
              },
              child: Text("MARK ATTENDANCE")),
        ],
      ),
    );
  }
}

Widget page(String code) {
  return Center(
    child: Container(
        child: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        "The Roll number of student is $code",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
      ),
    )),
  );
}
