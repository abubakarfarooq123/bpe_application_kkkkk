import 'package:bpe_application/id_verification/id_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
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
      Padding(padding: EdgeInsets.fromLTRB(80, 30, 10, 0),
      child: Image.asset("assets/images/bpepassport.png",
      height: 350,
      width: 350,),
      ),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 1, 15, 0),
            child: Text("For the safety of the community, ID verification must be done to board a flight.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.limelight(
                  color: Colors.black,
                  fontSize: 13,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
            child: Text("Please have your valid driver’s license or passposrt ready.",
              style: GoogleFonts.limelight(
                color: Colors.black,
                fontSize: 13,
                letterSpacing: 0.8
              ),
            ),
          ),
          SizedBox(
            height: 120,
          ),
          Center(
            child: Container(
              height: 40.0,
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
                          builder: (context) => ID_Verification()));
                },
                color: Color.fromARGB(255, 218, 162, 16),
                child: Text(
                  'Start Verification',
                  style: GoogleFonts.limelight(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
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
