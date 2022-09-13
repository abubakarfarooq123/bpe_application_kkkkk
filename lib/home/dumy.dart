// import 'dart:ui';
//
// import 'package:bpe_application/home/home.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// class Checkout extends StatefulWidget {
// final dc;
//   const Checkout({super.key, required this.dc});
//
//   @override
//   _CheckoutState createState() => _CheckoutState();
// }
//
// class _CheckoutState extends State<Checkout> {
//   final _formkey = GlobalKey<FormState>();
//   var price = '';
//   var name = '';
//   var location = '';
//   var des = '';
//   var total = '';
//   var review = '';
//   // checkout() async {
//   //   await FirebaseFirestore.instance
//   //       .collection('Hotels')
//   //       .doc(FirebaseAuth.instance.currentUser!.uid)
//   //       .set({
//   //     'From': widget.dc.get('from'),
//   //     'To': widget.dc.get('to'),
//   //     'City1': widget.dc.get('city1'),
//   //     'City2': widget.dc.get('city2'),
//   //     'Name': name,
//   //     'Location': location,
//   //     'Description': des,
//   //     'Price': price,
//   //     'Total': total,
//   //     'Review':review,
//   //   })
//   //       .then((value) => print('User Added'))
//   //       .catchError((error) => print('Falied to add user: $error'));
//   // }
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
//         body: FutureBuilder<DocumentSnapshot>(
//           future: FirebaseFirestore.instance
//               .collection('AddHotel')
//               .doc(FirebaseAuth.instance.currentUser?.uid)
//               .get(),
//           builder: (BuildContext context,
//               AsyncSnapshot<DocumentSnapshot> snapshot) {
//             if (snapshot.hasError) {
//               print('somthing went wrong');
//             }
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             var data = snapshot.data;
//             price = data!['Price'];
//             name = data['Name'];
//             location = data['Location'];
//             review = data['Review'];
//             total = data['Total'];
//             des = data['Description'];
//               return Form(
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
//                             initialValue: name,
//                             autofocus: false,
//                             onChanged: (value) => name = value,
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
//                             initialValue: location,
//                             autofocus: false,
//                             onChanged: (value) => location = value,
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
//                             initialValue: price,
//                             autofocus: false,
//                             onChanged: (value) => name = value,
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
//                             initialValue: review,
//                             autofocus: false,
//                             onChanged: (value) => review = value,
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
//                             initialValue: des,
//                             autofocus: false,
//                             onChanged: (value) => des = value,
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
//                             initialValue: total,
//                             autofocus: false,
//                             onChanged: (value) => total = value,
//                             decoration: InputDecoration(
//                               hintText: 'Name',
//                               icon: Icon(
//                                 FontAwesomeIcons.user,
//                                 color: Colors.teal[700],
//                               ),
//                             ),
//                           ),
//                         ),
//                         // Padding(
//                         //   padding: const EdgeInsets.only(left: 0.0),
//                         //   child: Container(
//                         //     margin: EdgeInsets.symmetric(vertical: 10),
//                         //     padding: EdgeInsets.symmetric(
//                         //         horizontal: 20, vertical: 5),
//                         //     //width: size.width * 0.8,
//                         //     decoration: BoxDecoration(
//                         //       color: Colors.white,
//                         //       borderRadius: BorderRadius.circular(29),
//                         //     ),
//                         //     child: TextFormField(
//                         //       initialValue: widget.dc.get('from'),
//                         //       autofocus: false,
//                         //       keyboardType: TextInputType.multiline,
//                         //       maxLines: null,
//                         //       decoration: InputDecoration(
//                         //         hintText: 'Lab Test Name',
//                         //         icon: Icon(
//                         //           FontAwesomeIcons.notesMedical,
//                         //           color: Colors.teal[700],
//                         //         ),
//                         //       ),
//                         //     ),
//                         //   ),
//                         // ),
//                         // Padding(
//                         //   padding: const EdgeInsets.only(left: 0.0),
//                         //   child: Container(
//                         //     margin: EdgeInsets.symmetric(vertical: 10),
//                         //     padding: EdgeInsets.symmetric(
//                         //         horizontal: 20, vertical: 5),
//                         //     //width: size.width * 0.8,
//                         //     decoration: BoxDecoration(
//                         //       color: Colors.white,
//                         //       borderRadius: BorderRadius.circular(29),
//                         //     ),
//                         //     child: TextFormField(
//                         //       initialValue: widget.dc.get('to'),
//                         //       autofocus: false,
//                         //       keyboardType: TextInputType.multiline,
//                         //       maxLines: null,
//                         //       decoration: InputDecoration(
//                         //         hintText: 'Lab Test Name',
//                         //         icon: Icon(
//                         //           FontAwesomeIcons.notesMedical,
//                         //           color: Colors.teal[700],
//                         //         ),
//                         //       ),
//                         //     ),
//                         //   ),
//                         // ),
//                         // Padding(
//                         //   padding: const EdgeInsets.only(left: 0.0),
//                         //   child: Container(
//                         //     margin: EdgeInsets.symmetric(vertical: 10),
//                         //     padding: EdgeInsets.symmetric(
//                         //         horizontal: 20, vertical: 5),
//                         //     //width: size.width * 0.8,
//                         //     decoration: BoxDecoration(
//                         //       color: Colors.white,
//                         //       borderRadius: BorderRadius.circular(29),
//                         //     ),
//                         //     child: TextFormField(
//                         //       initialValue: widget.dc.get('city1'),
//                         //       autofocus: false,
//                         //       keyboardType: TextInputType.multiline,
//                         //       maxLines: null,
//                         //       decoration: InputDecoration(
//                         //         hintText: 'Lab Test Name',
//                         //         icon: Icon(
//                         //           FontAwesomeIcons.notesMedical,
//                         //           color: Colors.teal[700],
//                         //         ),
//                         //       ),
//                         //     ),
//                         //   ),
//                         // ),
//                         // Padding(
//                         //   padding: const EdgeInsets.only(left: 0.0),
//                         //   child: Container(
//                         //     margin: EdgeInsets.symmetric(vertical: 10),
//                         //     padding: EdgeInsets.symmetric(
//                         //         horizontal: 20, vertical: 5),
//                         //     //width: size.width * 0.8,
//                         //     decoration: BoxDecoration(
//                         //       color: Colors.white,
//                         //       borderRadius: BorderRadius.circular(29),
//                         //     ),
//                         //     child: TextFormField(
//                         //       initialValue: widget.dc.get('city2'),
//                         //       autofocus: false,
//                         //       keyboardType: TextInputType.multiline,
//                         //       maxLines: null,
//                         //       decoration: InputDecoration(
//                         //         hintText: 'Lab Test Name',
//                         //         icon: Icon(
//                         //           FontAwesomeIcons.notesMedical,
//                         //           color: Colors.teal[700],
//                         //         ),
//                         //       ),
//                         //     ),
//                         //   ),
//                         // ),
//                         //
//
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
//                                 setState(() {
//                                   // checkout();
//
//                                 });
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
//               );
//             },
//           ),
//         );
//   }
// }
