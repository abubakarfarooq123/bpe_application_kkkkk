import 'package:bpe_application/home/home_navbar_screen.dart';
import 'package:bpe_application/splashscreens/sendingsplash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ID_Card_Pop_Up extends StatefulWidget {
  const ID_Card_Pop_Up({Key? key}) : super(key: key);

  @override
  State<ID_Card_Pop_Up> createState() => _ID_Card_Pop_UpState();
}

class _ID_Card_Pop_UpState extends State<ID_Card_Pop_Up> {
  final _formKey = GlobalKey<FormState>();
  var name = "";
  var dob = "";
  var date_of_issue = "";
  var date_of_expiry = "";
  var id = "";

  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final date_of_issueController = TextEditingController();
  final date_of_expiryController = TextEditingController();
  final idController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    dobController.dispose();
    date_of_expiryController.dispose();
    date_of_issueController.dispose();
    idController.dispose();
    super.dispose();
  }

  add() async {
    await FirebaseFirestore.instance
        .collection('ID Card')
        .doc()
        .set({
          'Name': name,
          'DOB': dob,
          'Date_Of_Issue': date_of_issue,
          'Date_Of_Expiry': date_of_expiry,
          "ID_Crad": id,
        })
        .then((value) => print('User Added'))
        .catchError((error) => print('Falied to add user: $error'));
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
          "ID Card Validation",
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Icon(
                  FontAwesomeIcons.idCard,
                  size: 40,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "ID Card Verification",
                  style:
                  GoogleFonts.roboto(color: Colors.black),
                ),
                Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.person),
                                      hintText: "Enter Name"),
                                  controller: nameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Name';
                                    }
                                    return null;
                                  }),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.calendar_today_rounded),
                                      hintText: "Date of Birth"),
                                  onTap: () async {
                                    DateTime? pickeddate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1980),
                                      lastDate: DateTime(2101),
                                    );
                                    if (pickeddate != null) {
                                      setState(() {
                                        dobController.text =
                                            DateFormat('yyyy/MM/dd')
                                                .format(pickeddate);
                                      });
                                    }
                                  },
                                  controller: dobController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Date Of Birth';
                                    }
                                    return null;
                                  }),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.calendar_today_rounded),
                                      hintText: "Date of Issue"),
                                  onTap: () async {
                                    DateTime? pickeddate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1980),
                                      lastDate: DateTime(2101),
                                    );
                                    if (pickeddate != null) {
                                      setState(() {
                                        date_of_issueController.text =
                                            DateFormat('yyyy/MM/dd')
                                                .format(pickeddate);
                                      });
                                    }
                                  },
                                  controller: date_of_issueController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Date Of Issue';
                                    }
                                    return null;
                                  }),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.calendar_today_rounded),
                                      hintText: "Date of Expiration"),
                                  onTap: () async {
                                    DateTime? pickeddate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1980),
                                      lastDate: DateTime(2101),
                                    );
                                    if (pickeddate != null) {
                                      setState(() {
                                        date_of_expiryController.text =
                                            DateFormat('yyyy/MM/dd')
                                                .format(pickeddate);
                                      });
                                    }
                                  },
                                  controller: date_of_expiryController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Date Of Expiry';
                                    }
                                    return null;
                                  }),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.credit_card_rounded),
                                      hintText: "ID Card Number"),
                                  controller: idController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter ID';
                                    }
                                    return null;
                                  }),
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
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        name = nameController.text;
                                        dob = dobController.text;
                                        date_of_issue =
                                            date_of_issueController.text;
                                        date_of_expiry =
                                            date_of_expiryController.text;
                                        id = idController.text;
                                        add();
                                      });
                                      showModalBottomSheet(
                                        context: context,
                                        builder: ((builder) =>
                                            dialogContent()),
                                      );
                                    }
                                  },
                                  child: Text("Confirm",
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                  ),),
                                ),
                              ),

                          ],
                        ),
                      ),

                    ],
                  ),
                ],
            ),
          ),
        ),
      ),
    );
  }
  Widget dialogContent() {
    return Column(
      children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 16, right: 16, left: 16),
              margin: EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(17),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Image(image: AssetImage('assets/images/verification.gif')),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Thanks for sharing your details",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "We received your details. Our team will check it out and come back to you in a bit on this if any other thing needed.",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Thanks For Using BPE Air",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 10
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 20,
                      width: 100,
                      color: Color.fromARGB(255, 218, 162, 16),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => homeNavBar()));
                        },
                        child: Text(
                          "Continue",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

}
