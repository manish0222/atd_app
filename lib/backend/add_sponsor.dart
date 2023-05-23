import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '/reusable_widgets/reusable_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:atd_app/backend/userdata.dart';
import '/utils/color_utils.dart';
import '/Screens/home.dart';
// import '/reusable_widgets/reusable_widget.dart';
import '/Screens/signin.dart';

class addSponsor extends StatefulWidget {
  const addSponsor({super.key});

  @override
  State<addSponsor> createState() => _addSponsorState();
}

class _addSponsorState extends State<addSponsor> {
  //Map
  @override
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _NameTextController = TextEditingController();
  TextEditingController _RollNumTextController = TextEditingController();
  TextEditingController _PhoneTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "ADD SPONSORSHIP",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4"),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Name ", Icons.person_outline, false,
                    _NameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Rollnumber ", Icons.lock_outlined,
                    true, _RollNumTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email id", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Phone", Icons.lock_outlined, true,
                    _PhoneTextController),
                const SizedBox(
                  height: 20,
                ),
                addSponsorButton(context, () {
                  Map<String, String> data = {
                    'Name': _NameTextController.text,
                    'Email-id': _emailTextController.text,
                    'Phone': _PhoneTextController.text,
                    'Rollnum': _RollNumTextController.text,
                  };
                  FirebaseFirestore.instance
                      .collection("users")
                      .add(data)
                      .then((value) {
                    print("Created New user");
                    map['Name'] = _NameTextController.text.toString();
                    map['Email-id'] = _emailTextController.text.toString();
                    map['Phone'] = _PhoneTextController.text.toString();
                    map['Rollnum'] = _RollNumTextController.text.toString();
                    print("the roll num is " + map['Rollnum'].toString());
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                  // FirebaseAuth.instance.createUserWithEmailAndPassword(
                  //   email: _emailTextController.text,
                  //   password: _passwordTextController.text
                  // ).then((value){
                  //   print("Created New Sponsor");
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  // }).onError((error, stackTrace) {
                  //   print("Error ${error.toString()}");
                  // });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
