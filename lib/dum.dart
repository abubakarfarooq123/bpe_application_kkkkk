// import 'dart:ui';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:path/path.dart';
//
// class Checkout extends StatefulWidget {
//   // var dc;
//   // Checkout({this.dc});
//
//   @override
//   _CheckoutState createState() => _CheckoutState();
// }
//
// class _CheckoutState extends State<Checkout> {
//   final _formkey = GlobalKey<FormState>();
//   var name = '';
//   var price = '';
//   var location = '';
//   var review = '';
//   var total = '';
//   var description = '';
//   final nameController =  TextEditingController();
//   final priceController = TextEditingController();
//   final locationController = TextEditingController();
//   final reviewController = TextEditingController();
//   final totalController = TextEditingController();
//   final descriptionController = TextEditingController();
//   checkout() async {
//     await FirebaseFirestore.instance
//         .collection('AddHotel')
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .set({
//       'name': name,
//       'location': location,
//       'price': price,
//       'review': review,
//       'description': description,
//       'total':total,
//     })
//         .then((value) => print('User Added'))
//         .catchError((error) => print('Falied to add user: $error'));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.teal[700],
//         appBar: AppBar(
//           elevation: 0.0,
//           centerTitle: true,
//           backgroundColor: Colors.transparent,
//           title: Text(
//             "Check Out",
//             style: TextStyle(
//               fontSize: 45.0,
//               fontFamily: "Lato-BoldItalic",
//               color: Colors.white,
//             ),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Form(
//           key: _formkey,
//                 child: Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(40.0),
//                       topRight: Radius.circular(40.0),
//                     ),
//                   ),
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(18.0),
//                           child: TextFormField(
//                             autofocus: false,
//                             decoration: InputDecoration(
//                               hintText: 'Name',
//                               icon: Icon(
//                                 FontAwesomeIcons.user,
//                                 color: Colors.teal[700],
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(18.0),
//                           child: TextFormField(
//                             autofocus: false,
//                             decoration: InputDecoration(
//                               hintText: 'Location',
//                               errorStyle: TextStyle(
//                                 color: Colors.redAccent,
//                                 fontSize: 15.0,
//                               ),
//                               icon: Icon(
//                                 FontAwesomeIcons.envelope,
//                                 color: Colors.teal[700],
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(18.0),
//                           child: TextFormField(
//                             autofocus: false,
//                             decoration: InputDecoration(
//                               hintText: 'Price',
//                               icon: Icon(
//                                 FontAwesomeIcons.phone,
//                                 color: Colors.teal[700],
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(18.0),
//                           child: TextFormField(
//                             autofocus: false,
//                             decoration: InputDecoration(
//                               hintText: 'Review',
//                               icon: Icon(
//                                 FontAwesomeIcons.idCard,
//                                 color: Colors.teal[700],
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 0.0),
//                           child: Container(
//                             margin: EdgeInsets.symmetric(vertical: 10),
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 5),
//                             //width: size.width * 0.8,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(29),
//                             ),
//                             child: TextFormField(
//                               autofocus: false,
//                               keyboardType: TextInputType.multiline,
//                               maxLines: null,
//                               decoration: InputDecoration(
//                                 hintText: 'Description',
//                                 icon: Icon(
//                                   FontAwesomeIcons.home,
//                                   color: Colors.teal[700],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 0.0),
//                           child: Container(
//                             margin: EdgeInsets.symmetric(vertical: 10),
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 5),
//                             //width: size.width * 0.8,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(29),
//                             ),
//                             child: TextFormField(
//                               autofocus: false,
//                               keyboardType: TextInputType.multiline,
//                               maxLines: null,
//                               decoration: InputDecoration(
//                                 hintText: 'Total',
//                                 icon: Icon(
//                                   FontAwesomeIcons.home,
//                                   color: Colors.teal[700],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 150,
//                         ),
//                         Center(
//                           child: Container(
//                             height: 40.0,
//                             width: 340.0,
//                             // ignore: deprecated_member_use
//                             child: RaisedButton(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30.0),
//                               ),
//                               onPressed: () {
//                                 if (_formkey.currentState!.validate()) {
//                                   setState(() {
//                                     name = nameController.text;
//                                     price = priceController.text;
//                                     review = reviewController.text;
//                                     total = totalController.text;
//                                     location = locationController.text;
//                                     description = descriptionController.text;
//                                   });
//                                   checkout();
//                                 }
//                               },
//                               color: Colors.teal[700],
//                               child: Text(
//                                 'Check Out',
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                       ]),
//                 ),
//               ),
//
//           ),
//         );
//   }
// }
