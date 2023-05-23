import 'package:flutter/material.dart';

import '../backend/userdata.dart';

class PreStu extends StatelessWidget {
  const PreStu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PRESENT STUDENTS"),
      ),
      body: ListView(
          children: present
              .map((item) => ListTile(
                    title: Text(item),
                  ))
              .toList()),
    );
  }
}
