import 'package:bpe_application/id_verification/check_license.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Update_License extends StatefulWidget {
  const Update_License({Key? key}) : super(key: key);

  @override
  State<Update_License> createState() => _Update_LicenseState();
}

class _Update_LicenseState extends State<Update_License> {
  final _formKey = GlobalKey<FormState>();
  var name = "";
  var dob = "";
  var date_of_issue = "";
  var date_of_expiry = "";
  var license = "";
  Future updateUser(
      name,
      date_of_issue,
      date_of_expiry,
      dob,
      license
      ) async {
    await FirebaseFirestore.instance
        .collection("License")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({
      'Name': name,
      'DOB': dob,
      'Date_Of_Issue': date_of_issue,
      "Date_Of_Expiry":date_of_expiry,
      "License":license

    });
  }

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //top bar color
      systemNavigationBarColor: Colors.black, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Drinig License Update",
          style: GoogleFonts.roboto(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
      body: ClipRRect(
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(40.0),
          topRight: const Radius.circular(40.0),
        ),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Container(
              height: 800,
              child: FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('License')
                      .doc(FirebaseAuth.instance.currentUser?.uid)
                      .get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print('somthing went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    var data = snapshot.data;
                    name = data!['Name'];
                    dob = data['DOB'];
                    date_of_issue = data['Date_Of_Issue'];
                    date_of_expiry = data['Date_Of_Expiry'];
                    license = data['License'];
                    return Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                                initialValue: name,
                              onChanged: (value) => name = value,
                              decoration: InputDecoration(
                                    icon: Icon(Icons.person),
                                    hintText: "Enter Name"),
                               ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                                initialValue: dob,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                              onChanged: (value) => dob = value,
                              decoration: InputDecoration(
                                    icon: Icon(Icons.calendar_today_rounded),
                                    hintText: "Date of Birth"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                                initialValue: date_of_issue,
                              onChanged: (value) => date_of_issue = value,
                              keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                    icon: Icon(Icons.calendar_today_rounded),
                                    hintText: "Date of Issue"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                                initialValue: date_of_expiry,
                              onChanged: (value) => date_of_expiry = value,
                              keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                    icon: Icon(Icons.calendar_today_rounded),
                                    hintText: "Date of Expiration"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                                initialValue: license,
                              onChanged: (value) => license = value,
                              decoration: InputDecoration(
                                    icon: Icon(Icons.credit_card_rounded),
                                    hintText: "License Number"),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 40,
                            width: 300,
                            color: Color.fromARGB(255, 218, 162, 16),
                            child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0),
                                ),
                                child: Text("Update"),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    updateUser(name, dob, date_of_expiry,
                                        date_of_issue, license);
                                  }

                                },
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
