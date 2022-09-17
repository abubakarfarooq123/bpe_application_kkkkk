import 'package:bpe_application/id_verification/driving_license.dart';
import 'package:bpe_application/id_verification/id_card.dart';
import 'package:bpe_application/id_verification/passport_popup.dart';
import 'package:bpe_application/splashscreens/sendingsplash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
class ID_Verification extends StatefulWidget {
  const ID_Verification({Key? key}) : super(key: key);

  @override
  State<ID_Verification> createState() => _ID_VerificationState();
}

class _ID_VerificationState extends State<ID_Verification> {

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
        title: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: Text(
            "ID Verification",
            style: GoogleFonts.limelight(
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: ClipRRect(
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(40.0),
          topRight: const Radius.circular(40.0),
        ),
        child: Container(
          height: 800.0,
          width: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 50, 15, 0),
                      child: Text("Scan Your Documents",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.almendra(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: Container(
                        height: 50.0,
                        width: 340.0,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Passport_Pop_Up()));
                          },
                          color: Color.fromARGB(255, 218, 162, 16),
                          child: Row(
                            children: [
                              Icon(FontAwesomeIcons.passport,
                              color: Colors.white,),
                              SizedBox(
                                width: 100,
                              ),
                              Text(
                                'Passport',
                                style: GoogleFonts.limelight(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    Center(
                      child: Container(
                        height: 50.0,
                        width: 340.0,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => License_Pop_Up()));
                          },
                          color: Color.fromARGB(255, 218, 162, 16),
                          child: Row(
                            children: [
                              Icon(FontAwesomeIcons.car,
                              color: Colors.white,),
                              SizedBox(
                                width: 100,
                              ),
                              Text(
                                'License',
                                style: GoogleFonts.limelight(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    Center(
                      child: Container(
                        height: 50.0,
                        width: 340.0,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ID_Card_Pop_Up()));
                          },
                          color: Color.fromARGB(255, 218, 162, 16),
                          child: Row(
                            children: [
                              Icon(FontAwesomeIcons.idCard,
                              color: Colors.white,),
                              SizedBox(
                                width: 100,
                              ),
                              Text(
                                'ID Card',
                                style: GoogleFonts.limelight(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
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


  }

