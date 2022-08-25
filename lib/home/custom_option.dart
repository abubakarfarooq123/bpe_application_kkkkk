import 'package:bpe_application/trip/vacation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
class Custom_Option extends StatefulWidget {
  const Custom_Option({Key? key}) : super(key: key);

  @override
  State<Custom_Option> createState() => _Custom_OptionState();
}

class _Custom_OptionState extends State<Custom_Option> {
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
          padding: const EdgeInsets.fromLTRB(20,0,0,0),
          child: Text("Custom Option",
          style: GoogleFonts.limelight(
            fontSize: 25
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 500,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 10, 220, 10),
                                  child: Text(
                                    "Itinerary",
                                    style: GoogleFonts.limelight(
                                      color: Colors.black,
                                      fontSize: 15,
                                      letterSpacing: 0.5
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                      child: Text(
                                        "14 September 2022",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.limelight(
                                          color: Colors.black,
                                          fontSize: 13,
                                          letterSpacing: 0.5
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(45, 15, 0, 0),
                                      child: Text("14 September 2022",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.limelight(
                                          color: Colors.black,
                                          fontSize: 13,
                                          letterSpacing: 0.5
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                        "12:00 PM",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.limelight(
                                          color: Colors.black,
                                          fontSize: 13,
                                          letterSpacing: 0.5
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(65, 5, 0, 0),
                                      child: Text(
                                        "EFT 0h 21m",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.limelight(
                                          color: Colors.black,
                                          fontSize: 13,
                                          letterSpacing: 0.5
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(40, 5, 0, 0),
                                      child: Text("12:21 PM",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.limelight(
                                          color: Colors.black,
                                          fontSize: 13,
                                          letterSpacing: 0.5
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                      child: Text(
                                        "OPKC",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.limelight(
                                          color: Colors.black,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(60, 15, 0, 0),
                                      child: Text(
                                        "-------------",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.limelight(
                                          color: Colors.black,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(65, 15, 0, 0),
                                      child: Text("OPKC",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.limelight(
                                          color: Colors.black,
                                          fontSize: 13,
                                          letterSpacing: 0.5
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                      child: Text(
                                        "Mexico Punta Mita",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.limelight(
                                          color: Colors.black,
                                          fontSize: 13,
                                            letterSpacing: 0.5
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(65, 15, 0, 0),
                                      child: Text(
                                        "Atlanta Georgia",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.limelight(
                                          color: Colors.black,
                                          fontSize: 13,
                                            letterSpacing: 0.5
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 140, 10),
                              child: Text("Terms Of Services",
                                style: GoogleFonts.limelight(
                                  fontSize: 15,
                                  color: Colors.black,
                                    letterSpacing: 0.5
                                ),),
                            ),
                            SingleChildScrollView(
                              child: Container(
                                width: 330,
                                height: 230,
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 217, 217, 217),

                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("After you submit the request an advisor will contact you and confirm with message about the seat and flight you want, and you can confirm an aircraft for the booking. For the avoidance of doubt this is a fully cancelable request and you will incur no charges to finalize the booking.",
                                      textAlign: TextAlign.justify,
                                      style: GoogleFonts.limelight(
                                        color: Colors.black,
                                        fontSize: 13,
                                        letterSpacing: 1
                                      ),
                                    ),

                                  ],

                                ),
                              ),
                            ),

                          ],

                        ),
                      ),
                      SizedBox(
                        height: 60,
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
                                  builder: (context) => Vacation())); },
                          child: Center(
                            child: Text(
                              "Request",
                              style: GoogleFonts.limelight(
                                color: Colors.white,
                              )
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



