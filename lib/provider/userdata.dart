// import 'package:bpe_application/Model/usermodel.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
//
// class userData extends ChangeNotifier{
//
//   late UserModel currentData;
//
//   void getUserData() async {
//     UserModel userModel;
//     var value = await FirebaseFirestore.instance
//         .collection("registration")
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .get();
//     if (value.exists) {
//       userModel = UserModel(
//         uid: value.get("uid"),
//         email: value.get("email"),
//         image: value.get("Image"),
//         name: value.get("name"),
//         phone: value.get('phone'),
//       );
//       currentData = userModel;
//       notifyListeners();
//     }
//   }
//
//   UserModel get currentUserData {
//     return currentData;
//   }
//
//   void UpdateData(String ImagePath,String phone,String name,String city)async{
//     await FirebaseFirestore.instance.collection('registration').doc(FirebaseAuth.instance.currentUser!.uid).update({
//       "email":currentData.email,
//       "Image":ImagePath,
//       "name":name,
//       "phone":phone,
//     });
//     notifyListeners();
//   }
// }