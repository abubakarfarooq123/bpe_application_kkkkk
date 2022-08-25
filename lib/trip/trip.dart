import 'package:bpe_application/home/home.dart';
import 'package:bpe_application/trip/vacation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
class Trip extends StatefulWidget {
  const Trip({Key? key}) : super(key: key);

  @override
  State<Trip> createState() => _TripState();
}

class _TripState extends State<Trip> {
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
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(40,0,0,0),
          child: Text("My Booking",
          style: GoogleFonts.limelight(
            fontSize: 25,

          ),),
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 80, 0, 0),
                    child:
                      Image.asset("assets/images/lv.png"),
                  ),
                  Container(
                    height: 50,
                    width: 140,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Color.fromARGB(255, 218, 162, 16),
                      onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home())); },
                      child: Center(
                        child: Text(
                          "Book a Flight",
                          style: GoogleFonts.limelight(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],

              ),
            ),
          ),
        ),


    );
  }
}