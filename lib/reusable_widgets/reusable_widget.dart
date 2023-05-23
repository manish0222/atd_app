import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

Image logoWidget(String imageName){
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
  //  color: Colors.white,
  );
}

  Future<void> _launchUniversalLinkApp(Uri url) async { 
     final bool nativeAppLaunchSucceeded = await launchUrl( 
       url, 
       mode: LaunchMode.externalNonBrowserApplication, 
     ); 
     if (!nativeAppLaunchSucceeded) { 
       await launchUrl( 
         url, 
         mode: LaunchMode.inAppWebView, 
       ); 
     } 
   }


TextField reusableTextField(String text, IconData icon, bool isPasswordType, TextEditingController controller){
  return TextField(
  controller: controller,
  obscureText: isPasswordType,
  enableSuggestions: !isPasswordType,
  autocorrect: !isPasswordType,
  cursorColor: Colors.white,
  style: TextStyle(color: Colors.white.withOpacity(0.9)),
  decoration: InputDecoration(
    prefixIcon: Icon(
      icon,
      color: Colors.white70,
    ),
    labelText: text,
    labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    fillColor: Colors.white.withOpacity(0.3),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: const BorderSide(width: 0,style: BorderStyle.none)
    ),
  ),
  keyboardType: isPasswordType 
    ?TextInputType.visiblePassword 
    : TextInputType.emailAddress,
  );
}

Container signInSignUpButton(BuildContext context, bool isLogin, Function onTap){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: (){
        onTap();
      },
      style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states){
        if(states.contains(MaterialState.pressed)){
          return Colors.black26;
        }
        return Colors.white;
      }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
        )
      ),
      child: Text(
        isLogin ? 'LOG IN' : 'SIGN UP',
        style: const TextStyle(
          color: Colors.black87, fontWeight: FontWeight.bold,fontSize: 16
        ),
      ),
    ),
  );
}

Container addSponsorButton(BuildContext context, Function onTap){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: (){
        onTap();
      },
      style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states){
        if(states.contains(MaterialState.pressed)){
          return Colors.black26;
        }
        return Colors.white;
      }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
        )
      ),
      child: const Text(
        " ADD ",
        style: TextStyle(
          color: Colors.black87, fontWeight: FontWeight.bold,fontSize: 16
        ),
      ),
    ),
  );
}

Container dev(BuildContext context, String name, String image, String linkedIn, String bioData, String email ){
  return Container(
    width: 300,
   // height: 200,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child:SingleChildScrollView(
      child: Column(
      children: <Widget>[
        //logoWidget("${image}"),
        CircleAvatar(
          backgroundImage: AssetImage(image),
          radius: 100,
        ),
        Text(name,style: const TextStyle(color:Colors.black, fontWeight: FontWeight.bold,fontSize: 20)),
        Center(
          child: Row(
            children: [
              const SizedBox(width: 100,),
              //Text("LinkedIn : ",style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold,fontSize: 16),),
              IconButton(icon: const Icon(Icons.mail), onPressed: () async=> await launchUrl(Uri.parse('mailto:$email?'))),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.linkedin),
                onPressed: () async => await _launchUniversalLinkApp(Uri.parse(linkedIn))
               ),

              //Text("${linkedIn}",style: TextStyle(color:Colors.blue, fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
        ), 
        Text(bioData,style: const TextStyle(color:Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    ),) 


  );
}

// Container slide(BuildContext context,){
//   List imageList = [
//     {"id": 1, "image path": "assets/images/img1.jpg"},
//     {"id": 2, "image path": "assets/images/img2.jpg"},
//     {"id": 3, "image path": "assets/images/img3.jpg"},
//   ];
//   final CarouselController carouselController = CarouselController();
//   int currindex=0;
//   return SizedBox(
//       width: MediaQuery.of(context).size.width,
//       height: 0.35*MediaQuery.of(context).size.height,
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(
//               20, 40, 20, 20
//             ),
//             child: Column(
//               children: [
//                 Stack(
//                   children: [
//                     InkWell(
//                       onTap: (){ print(currindex);},
//                       child: CarouselSlider(
//                         items: imageList.map((item) => Image.asset(item['image path'],fit: BoxFit.cover,width: double.infinity,),).toList(), 
//                         carouselController: carouselController,
//                         options: CarouselOptions(
//                           scrollPhysics: const BouncingScrollPhysics(),
//                           autoPlay: true,
//                           aspectRatio: 2,
//                           viewportFraction: 1,
//                           onPageChanged: (index, reason){
//                             //setState(() {
//                               currindex=index;
//                            // });
//                           }
//                         )),
//                     ),
//                     // Positioned(
//                     //   bottom: 10,
//                     //   left: 0,
//                     //   right: 0,
//                     //   child: Row(
//                     //     mainAxisAlignment: MainAxisAlignment.center,
//                     //     children: [],
//                     //   ),
//                     // ),
//                   ],
//                 )
//               ],
//             ),
//         ),
//       ),
//     );
// }

void showSnackBar(BuildContext context, String text)
  {
    final snackBar = SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 1),//default is 4s
    );
    // Find the Scaffold in the widget tree and use it to show a SnackBar.
  }

  void showPurchaseDialog(BuildContext context, String error) {
    showDialog(
      context: context,
      barrierDismissible: false, // disables popup to close if tapped outside popup (need a button to close)
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 149, 70, 196),
          elevation: 2,
          title: const Text("ERROR", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.red),),
          content: Text(error, style: const TextStyle(fontSize: 18, color: Colors.white),),
          //buttons?
          actions: <Widget>[
            ElevatedButton(
             // style: ButtonStyle(),
              child: const Text("Close"),
              onPressed: () { Navigator.of(context).pop(); }, //closes popup
            ),
          ],
        );
      }
    );
  }