// import 'package:bpe_application/home/home_navbar_screen.dart';
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class Sendindsplash extends StatefulWidget {
//   const Sendindsplash({Key? key}) : super(key: key);
//
//   @override
//   State<Sendindsplash> createState() => _SendindsplashState();
// }
//
// class _SendindsplashState extends State<Sendindsplash> {
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       child: dialogContent(context),
//     );
//   }
//
//   dialogContent(BuildContext context) {
//     return Column(
//         children: [
//           Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.only(top: 20, bottom: 16, right: 16, left: 16),
//                 margin: EdgeInsets.only(top: 16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   shape: BoxShape.rectangle,
//                   borderRadius: BorderRadius.circular(17),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black26,
//                       blurRadius: 10.0,
//                       offset: Offset(0.0, 10.0),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   children: [
//                     Image(image: AssetImage('assets/images/verification.gif')),
// SizedBox(
//   height: 20,
// ),
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                         "Thanks for sharing your details",
//                         style: GoogleFonts.limelight(
//                           color: Colors.black,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                         "We received your details. Our team will check it out and come back to you in a bit on this if any other thing needed.",
//                         style: GoogleFonts.limelight(
//                           color: Colors.black,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                         "Thanks For Using BPE Air",
//                         style: GoogleFonts.limelight(
//                           color: Colors.black,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10
//                     ),
//                     Align(
//                       alignment: Alignment.bottomRight,
//                       child: Container(
//                         height: 20,
//                         width: 100,
//                         color: Color.fromARGB(255, 218, 162, 16),
//                         child: FlatButton(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30.0),
//                           ),
//                           onPressed: () {
//                             Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => homeNavBar()));
//                           },
//                           child: Text(
//                             "Continue",
//                             style: GoogleFonts.limelight(
//                               color: Colors.white,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//     );
//   }
// }
