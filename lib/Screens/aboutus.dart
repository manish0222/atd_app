import 'package:flutter/material.dart';
import '/utils/color_utils.dart';
import '/reusable_widgets/reusable_widget.dart';

class aboutUs extends StatefulWidget {
  const aboutUs({super.key});

  @override
  State<aboutUs> createState() => _aboutUsState();
}

class _aboutUsState extends State<aboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SPO - BRO"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4"),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              20, 40, 20, 0
            ),
            child: Column(
              children: <Widget>[
                //logoWidget("assets/images/logo1.png"),
                Image.asset(
                  "assets/images/logo1.png",
                  fit: BoxFit.fitWidth,
                  width: 240,
                  height: 75,
                
  //  color: Colors.white,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text("DEVELOPERS",style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold, fontSize: 24)),
                SingleChildScrollView(
                  //scrollDirection:Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20,20,20,20),
                    child:  Column(
                      children: <Widget>[
                        dev(context, "Kaustubh Joshi", "assets/images/kaustubh.png", "https://www.linkedin.com/in/kaustubh-joshi-169684229", "App Developer (Frontend + Backend)","knj621311@gmail.com"),
                        const SizedBox(width: 30,),
                        dev(context, "Manish Godbole", "assets/images/manish.png", "https://www.linkedin.com/in/manish-godbole-375755238", "Web Developer (Frontend + Backend)","manishgodbole022@gmail.com"),
                      ],
                    ),
                  ),
                 
                ),
              ],
            ),
          ) 
        ),
      ),
    );
  }
}