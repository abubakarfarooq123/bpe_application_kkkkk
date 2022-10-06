// import 'package:bpe_application/id_verification/check_license.dart';
// import 'package:bpe_application/id_verification/driving_license.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// class If_Else extends StatefulWidget {
//   const If_Else({Key? key}) : super(key: key);
//
//   @override
//   State<If_Else> createState() => _If_ElseState();
// }
//
// class _If_ElseState extends State<If_Else> {
//   @override
//   Widget build(BuildContext context) {
//    return FutureBuilder<DocumentSnapshot>(
//         future: FirebaseFirestore.instance
//         .collection('License')
//         .doc(FirebaseAuth.instance.currentUser?.uid)
//         .get(),
//     builder: (BuildContext context,
//     AsyncSnapshot<DocumentSnapshot> snapshot) {
//       if (snapshot.hasData) {
//     if (snapshot.data.isNull) {
//     return License_Pop_Up();
//     }
//     return Check_License();
//     }
//       else {
//           return Container(
//             color: Colors.white,
//             child: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//       }
//   );
// }
// }
//
