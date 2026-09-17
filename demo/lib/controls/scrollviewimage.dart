// import 'package:flutter/material.dart';
// import '../resources/imagestring.dart';
// import '../controls/imagedisp.dart';

// class ScrollImageDisp extends StatefulWidget {
//   const ScrollImageDisp({super.key});

//   @override
//   State<ScrollImageDisp> createState() => _ScrollImageDispState();
// }

// class _ScrollImageDispState extends State<ScrollImageDisp> {
//   @override
//   Widget ScrollDisp(){
//     return SizedBox(
//       height: 80, //small icons
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: i2.length,
//         itemBuilder: (context, index){
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 6),
//             child: Image.asset(
//               i2[index],
//               width: 80,
//               height: 80,
//               fit: BoxFit.cover,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: SafeArea(
//       child: ScrollDisp(),
//     ),
//   );
// }