// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class slider extends StatefulWidget {
//   const slider({super.key});

//   @override
//   State<slider> createState() => _sliderState();
// }

// class _sliderState extends State<slider> {
//   List imageList = [
//     {"id": 1, "image path": "assets/images/img1.jpg"},
//     {"id": 2, "image path": "assets/images/img2.jpg"},
//     {"id": 3, "image path": "assets/images/img3.jpg"},
//   ];
//   final CarouselController carouselController = CarouselController();
//   int currindex=0;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height,
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.fromLTRB(
//               20, 40, 20, 20
//             ),
//             child: Column(
//               children: [
//                 Stack(
//                   children: [
//                     InkWell(
//                       onTap: (){print(currindex);},
//                       child: CarouselSlider(
//                         items: imageList.map((item) => Image.asset(item['image path'],fit: BoxFit.cover,width: double.infinity,),).toList(), 
//                         carouselController: carouselController,
//                         options: CarouselOptions(
//                           scrollPhysics: const BouncingScrollPhysics(),
//                           autoPlay: true,
//                           aspectRatio: 2,
//                           viewportFraction: 1,
//                           onPageChanged: (index, reason){
//                             setState(() {
//                               currindex=index;
//                             });
//                           }
//                         )),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//         ),
//       ),
//     );
//   }
// }