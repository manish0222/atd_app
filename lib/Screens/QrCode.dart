import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
// import '../helpers/global_data.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:atd_app/backend/userdata.dart';

class QrCode extends StatelessWidget {
  final String rollno;
  QrCode({super.key, required this.rollno});

  bool getqr = false;

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
            data: rollno.toString(),
            version: QrVersions.auto,
            size: 250,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          color: Colors.blueAccent,
          child: Text("The roll number is " + rollno),
        ),
      ]),
    );
  }
}
