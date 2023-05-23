import 'package:atd_app/Screens/Qr_Scan.dart';
import 'package:flutter/material.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    String ans = "abcd";
    TextEditingController _textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Enter text',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String userInput = _textEditingController.text.toString();
                if (userInput == "abcd") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ScanQr()));
                }
                print('User input: $userInput');
                // Perform further actions with the user input
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
