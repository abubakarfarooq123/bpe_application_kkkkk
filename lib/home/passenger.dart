import 'package:bpe_application/home/custome_option_navbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Pessenger extends StatefulWidget {
  const Pessenger({Key? key}) : super(key: key);

  @override
  State<Pessenger> createState() => _PessengerState();
}

class _PessengerState extends State<Pessenger> {
   int count=0;
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
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Text(
            "Passenger Option",
            style: GoogleFonts.limelight(fontSize: 20),
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 800,
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              child: Image.asset("assets/images/bpeairline.jfif"),
                              borderRadius: BorderRadius.circular(40),
                          ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 30, 250, 10),
                                child: Text(
                                  "Itinerary",
                                  style: GoogleFonts.limelight(
                                      color: Colors.black,
                                      fontSize: 15,
                                      letterSpacing: 0.5),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                    child: Text(
                                      "14 September 2022",
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.limelight(
                                          color: Colors.black,
                                          fontSize: 13,
                                          letterSpacing: 0.5),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(45, 15, 0, 0),
                                    child: Text(
                                      "14 September 2022",
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.limelight(
                                          color: Colors.black,
                                          fontSize: 13,
                                          letterSpacing: 0.5),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: Text(
                                      "12:00 PM",
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.limelight(
                                          color: Colors.black,
                                          fontSize: 13,
                                          letterSpacing: 0.5),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(65, 5, 0, 0),
                                    child: Text(
                                      "EFT 0h 21m",
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.limelight(
                                          color: Colors.black,
                                          fontSize: 13,
                                          letterSpacing: 0.5),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 5, 0, 0),
                                    child: Text(
                                      "12:21 PM",
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.limelight(
                                          color: Colors.black,
                                          fontSize: 13,
                                          letterSpacing: 0.5),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 15, 0, 0),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(90, 15, 0, 0),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(85, 15, 0, 0),
                                    child: Text(
                                      "OPKC",
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.limelight(
                                          color: Colors.black,
                                          fontSize: 13,
                                          letterSpacing: 0.5),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                    child: Text(
                                      "Mexico Punta Mita",
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.limelight(
                                          color: Colors.black,
                                          fontSize: 13,
                                          letterSpacing: 0.5),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(65, 15, 0, 0),
                                    child: Text(
                                      "Atlanta Katama",
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.limelight(
                                          color: Colors.black,
                                          fontSize: 13,
                                          letterSpacing: 0.5),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 220, 10),
                            child: Text(
                              "Passengers",
                              style: GoogleFonts.limelight(
                                  fontSize: 15,
                                  color: Colors.black,
                                  letterSpacing: 0.5),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FloatingActionButton.extended(
                                onPressed: (){
                                setState(() {
                                  count= count-1;
                                });
                              }, label: Text("",
                                style: GoogleFonts.limelight(
                                    color: Colors.white
                                ),
                              ),
                                icon: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Center(
                                    child: Icon(FontAwesomeIcons.minus,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                backgroundColor:Color.fromARGB(255, 218, 162, 16),
                              ),
                              Text("$count",
                              style: GoogleFonts.limelight(
                                color: Colors.black,
                                fontSize: 15,
                              ),),

                              FloatingActionButton.extended(onPressed: (){
                                setState(() {
                                  count= count+1;
                                });
                              }, label: Text("",
                                style: GoogleFonts.limelight(
                                    color: Colors.white
                                ),
                              ),
                                icon: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Icon(Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor:Color.fromARGB(255, 218, 162, 16),

                              ),


                            ],
                          ),
                          SizedBox(
                            height: 30,
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
                                      builder: (context) => CustomOptionNavBar())); },
                              child: Center(
                                child: Text(
                                    "Book",
                                    style: GoogleFonts.limelight(
                                      color: Colors.white,
                                    )
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
            ),
          ),
        ),
      ),
    );
  }
}
