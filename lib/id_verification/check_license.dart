// import 'package:bpe_application/id_verification/driving_license.dart';
// import 'package:bpe_application/id_verification/update_license.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
//
// class Check_License extends StatefulWidget {
//   const Check_License({Key? key}) : super(key: key);
//
//   @override
//   State<Check_License> createState() => _Check_LicenseState();
// }
//
// class _Check_LicenseState extends State<Check_License> {
//   var name="";
//   var dob="";
//   var date_of_expiry="";
//   var date_of_issue="";
//   var license="";
//
//   String formatted(timestamp) {
//     var dateFromTimeStamp =
//     DateTime.fromMillisecondsSinceEpoch(timestamp.seconds * 1000);
//     return DateFormat('dd-MM-yyyy').format(dateFromTimeStamp);
//   }
//
//   Widget list() {
//     return FutureBuilder(
//       future: FirebaseFirestore.instance
//           .collection('License')
//           .doc(FirebaseAuth.instance.currentUser?.uid)
//           .get(),
//       builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if(!snapshot.hasData){
//           var data = snapshot.data;
//           name = data!['Name'];
//           dob = data['DOB'];
//           date_of_issue = data['Date_Of_Issue'];
//           date_of_expiry = data['Date_Of_Expiry'];
//           license = data['License'];
//           return SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
//               child: Container(
//                 height: 300,
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 5,
//                       blurRadius: 7,
//                       offset: Offset(0, 3), // changes position of shadow
//                     ),
//                   ],
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 270),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       Update_License()));
//
//                               (route) => false;
//                         },
//                         child: Center(
//                             child: Icon(Icons.edit, color: Colors.white)),
//                         style: ElevatedButton.styleFrom(
//                           shape: CircleBorder(),
//                           padding: EdgeInsets.all(8),
//                           primary: Colors.black, // <-- Button color
//                           onPrimary: Color.fromARGB(
//                               255, 218, 162, 16), // <-- Splash color
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 20, left: 20),
//                       child: Row(
//                         children: [
//                           Text(
//                             "Name",
//                             style: GoogleFonts.roboto(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(
//                             width: 105,
//                           ),
//                           Text(
//                             name,
//                             style: GoogleFonts.roboto(color: Colors.black),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 20, left: 20),
//                       child: Row(
//                         children: [
//                           Text(
//                             "Date Of Birth",
//                             style: GoogleFonts.roboto(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 58,
//                           ),
//                           Text(
//                             dob,
//                             style: GoogleFonts.roboto(color: Colors.black),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 20, left: 20),
//                       child: Row(
//                         children: [
//                           Text(
//                             "Date Of Issue",
//                             style: GoogleFonts.roboto(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 56,
//                           ),
//                           Text(
//                             date_of_issue,
//                             style: GoogleFonts.roboto(color: Colors.black),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 20, left: 20),
//                       child: Row(
//                         children: [
//                           Text(
//                             "Date Of Expiration",
//                             style: GoogleFonts.roboto(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(
//                             width: 27,
//                           ),
//                           Text(
//                             date_of_expiry,
//                             style: GoogleFonts.roboto(color: Colors.black),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 20, left: 20),
//                       child: Row(
//                         children: [
//                           Text(
//                             "License No.",
//                             style: GoogleFonts.roboto(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 65,
//                           ),
//                           Text(
//                             license,
//                             style: GoogleFonts.roboto(color: Colors.black),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }
//        else{ return Center(
//             child:Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 30),
//                   child: Text(
//                     "Hey There,",style: GoogleFonts.roboto(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22
//                   ),),
//                 ),
//                 SizedBox(
//                   height: 50,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10,left: 15,right: 20),
//                   child: Text("You haven't put any detail yet please add some details and then check again. Add details so that we can continue with your process.",
//                     textAlign: TextAlign.justify,
//                     style: GoogleFonts.roboto(
//                         fontSize: 15,
//                         color: Colors.black
//                     ),),
//                 ),
//
//                 SizedBox(
//                   height: 90,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 10),
//                   child: Container(
//                     height: 50.0,
//                     width: 120.0,
//                     child: FlatButton(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.0),
//                       ),
//                       color: Color.fromARGB(255, 218, 162, 16),
//                       onPressed: () {
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => License_Pop_Up()));
//                       },
//                       child: Text(
//                         'Add Details',
//                         style: GoogleFonts.roboto(
//                           fontSize: 15.0,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ));}
//       },
//     );
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent, //top bar color
//       systemNavigationBarColor: Colors.black, //bottom bar color
//       systemNavigationBarIconBrightness: Brightness.dark,
//     ));
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         elevation: 0.0,
//         backgroundColor: Colors.transparent,
//         title: Padding(
//           padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
//           child: Text(
//             "License Detail",
//             style: GoogleFonts.roboto(color: Colors.white),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: ClipRRect(
//           borderRadius: new BorderRadius.only(
//             topLeft: const Radius.circular(40.0),
//             topRight: const Radius.circular(40.0),
//           ),
//           child: Container(
//             height: 800.0,
//             width: double.infinity,
//             color: Colors.grey.shade200,
//             child: list(),
//           ),
//         ),
//       ),
//     );
//   }
// }
