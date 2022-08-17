import 'package:bpe_application/trip/trip.dart';
import 'package:bpe_application/trip/trip_navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ViewTrip extends StatefulWidget {
  const ViewTrip({Key? key}) : super(key: key);

  @override
  State<ViewTrip> createState() => _ViewTripState();
}

class _ViewTripState extends State<ViewTrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                        child: Text("Enjoy your day",
                        style: GoogleFonts.limelight(
                          fontSize: 20,
                          color: Colors.black,
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: Text("James",
                          style: GoogleFonts.limelight(
                              fontSize: 22,
                              color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                          color: Colors.black,
                        thickness: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                        child: Image.asset("assets/images/bpeairline.jfif"),
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 50, 0),
                        child: Text("Thank you for requesting this private flight.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.limelight(
                              fontSize: 13,
                              color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                        child: Text("Our team will process your request. When flight is available you will receive an email or message in app message event.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.limelight(
                            fontSize: 13,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        height: 40,
                        width: 320,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Color.fromARGB(255, 218, 162, 16),
                          onPressed: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TripNavBar())); },
                          child: Center(
                            child: Text(
                              "View My Trip",
                              style: GoogleFonts.limelight(
                                color: Colors.white,
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
