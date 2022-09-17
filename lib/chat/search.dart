// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class SearchPage extends StatefulWidget {
//   const SearchPage({Key? key}) : super(key: key);
//
//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }
//
// class _SearchPageState extends State<SearchPage> {
//   TextEditingController searchController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent, //top bar color
//       systemNavigationBarColor: Colors.black, //bottom bar color
//       systemNavigationBarIconBrightness: Brightness.dark,
//     ));
//     return Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//         elevation: 0.0,
//         backgroundColor: Colors.transparent,
//         title: Padding(
//         padding: const EdgeInsets.fromLTRB(75, 0, 0, 0),
//     child: Text(
//     "Search",
//     style: GoogleFonts.roboto(color: Colors.white),
//     ),
//     ),
//     ),
//     body: ClipRRect(
//     borderRadius: new BorderRadius.only(
//     topLeft: const Radius.circular(40.0),
//     topRight: const Radius.circular(40.0),
//     ),
//     child: Container(
//       padding: EdgeInsets.symmetric(horizontal: 20,
//       vertical: 10),
//       color: Colors.white,
//       height: 800,
//       child: Column(
//         children: [
//           TextField(
//             controller: searchController,
//             decoration: InputDecoration(
//               hintText: "Enter Email......."
//             ),
//           ),
//          SizedBox(
//            height: 15,
//          ),
//          FlatButton(
//              shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(30.0),
//              ),
//              color: Color.fromARGB(255, 218, 162, 16),
//              onPressed: (){},
//              child: Text("Search",style: GoogleFonts.roboto(
//                color: Colors.white
//              ),)),
//           SizedBox(
//             height: 15,
//           ),
//           StreamBuilder(
//             stream: FirebaseFirestore.instance.
//             collection("registration").
//             where("email",isEqualTo: searchController.text).snapshots(),
//             builder: (context,snapshot){
//               if(snapshot.connectionState==ConnectionState.active){
//                 if (snapshot.hasData){
//                   QuerySnapshot dataSnapshot = snapshot.data as QuerySnapshot;
//                   Map<String,dynamic> UserMap= dataSnapshot.docs[0].data() as Map<String,dynamic>;
//                   UserModel searchedUser =
//
//                 }
//                 else if(snapshot.hasError){
//                   return Text("An Error Occured !");
//                 }
//                 else{
//                   return Text("No result Found");
//
//                 }
//               }
//               else{
//                 CircularProgressIndicator();
//               }
//             },
//           ),
//         ],
//       ),
//
//     ),
//     ),
//     );
//   }
// }
