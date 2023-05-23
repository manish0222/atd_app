import 'package:atd_app/Screens/Students.dart';
import 'package:flutter/material.dart';

class sucAtd extends StatelessWidget {
  const sucAtd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Attendance Marked",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: Colors.black54,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StudentList()));
            },
            child: Text("CHECK FINAL ATTENDANCE"),
          )
        ],
      ),
    );
  }
}
