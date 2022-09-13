// import 'package:bpe_application/home/home_navbar_screen.dart';
// import 'package:bpe_application/user/login.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:mobx/mobx.dart';
// class _DecisionsTreeState extends StatefulWidget {
//   const _DecisionsTreeState({Key? key}) : super(key: key);
//
//   @override
//   State<_DecisionsTreeState> createState() => _DecisionsTreeStateState();
// }
//
// class _DecisionsTreeStateState extends State<_DecisionsTreeState> {
//   User user;
//   @override
//   void initState(){
//     super.initState();
//     onRefresh(FirebaseAuth.instance.currentUser);
//   }
//   onRefresh(userCred){
//     setState(() {
//       user = userCred;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if(user==null){
//       return Login(
//         onSignInAno: (userCred) => onRefresh(userCred),
//       );
//     }
//     return homeNavBar();
//
//   }
// }
