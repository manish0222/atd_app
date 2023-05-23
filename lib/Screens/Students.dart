import 'package:atd_app/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:atd_app/backend/userdata.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students list"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
        ],
      ),
      body: ListView(
        children: Roll_List.map((item) => ListTile(
              title: Text(item),
            )).toList(),
      ),
    );
  }
}
