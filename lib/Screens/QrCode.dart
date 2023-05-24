import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
// import '../helpers/global_data.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:atd_app/backend/userdata.dart';

class QrCode extends StatefulWidget {
  final String rollno;
  QrCode({super.key, required this.rollno});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final String _uid;
  bool getqr = false;
  void initState() {
    super.initState();
    setState(() {
      getdata();
    });
  }

  void getdata() {
    User? user = _auth.currentUser;
    _uid = user!.uid;
    print("the user id is " + _uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR code testing'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        SizedBox(
          height: 20,
        ),
        // GestureDetector(
        //   onTap: () {}, // Image tapped
        //   child: QrImage(
        //     data: User.m!['UID'],
        //     version: QrVersions.auto,
        //     size: 250,
        //   ),
        // ),
        Center(
          child: QrImageView(
            data: _uid.toString(),
            version: QrVersions.auto,
            size: 250,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          color: Colors.blueAccent,
          child: Text("Verified User " + _uid),
        ),
      ]),
    );
  }
}
