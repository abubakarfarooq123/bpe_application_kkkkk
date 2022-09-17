import 'package:bpe_application/trip/vacation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Pessenger extends StatefulWidget {
  @override
  State<Pessenger> createState() => _PessengerState();
}

class _PessengerState extends State<Pessenger> {
  int count = 1;
  var date = '';

  String formatted(timestamp) {
    var dateFromTimeStamp =
        DateTime.fromMillisecondsSinceEpoch(timestamp.seconds * 1000);
    return DateFormat('dd-MM-yyyy').format(dateFromTimeStamp);
  }

  DateFormat formatter = DateFormat('yyyy-MM-dd');
  Future updateUser(selectedDT) async {
    var selectedDT = count;
    await FirebaseFirestore.instance
        .collection("Book")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({
      'passenger': selectedDT,
    });
  }

  Widget list() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Book").snapshots(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot dc = snapshot.data!.docs[index];
                    return Container(
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
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          child: Image.asset(
                                              "assets/images/bpeairline.jfif"),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 30, 250, 10),
                                            child: Text(
                                              "Itinerary",
                                              style: GoogleFonts.roboto(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  letterSpacing: 0.5,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 20, 0, 0),
                                                child: Text(
                                                  formatted(dc['date']),
                                                  textAlign: TextAlign.end,
                                                  style: GoogleFonts.roboto(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    letterSpacing: 0.5,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        160, 15, 0, 0),
                                                child: Text(
                                                  formatted(dc['enddate']),
                                                  textAlign: TextAlign.end,
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      letterSpacing: 0.5),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 5, 0, 0),
                                                child: Text(
                                                  "12:00 PM",
                                                  textAlign: TextAlign.end,
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      letterSpacing: 0.5),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        65, 5, 0, 0),
                                                child: Text(
                                                  "EFT 0h 21m",
                                                  textAlign: TextAlign.end,
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      letterSpacing: 0.5),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        40, 5, 0, 0),
                                                child: Text(
                                                  "12:21 PM",
                                                  textAlign: TextAlign.end,
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      letterSpacing: 0.5),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 15, 0, 0),
                                                child: Text(
                                                  dc['city1'],
                                                  textAlign: TextAlign.end,
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      letterSpacing: 0.5),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        100, 15, 0, 0),
                                                child: Text(
                                                  dc['city2'],
                                                  textAlign: TextAlign.end,
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.black,
                                                      fontSize: 14,
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
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 30, 220, 10),
                                        child: Text(
                                          "Passengers",
                                          style: GoogleFonts.roboto(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              letterSpacing: 0.5),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          FloatingActionButton.extended(
                                            onPressed: () {
                                              setState(() {
                                                count = count - 1;
                                              });
                                            },
                                            label: Text(
                                              "",
                                              style: GoogleFonts.roboto(
                                                  color: Colors.white),
                                            ),
                                            icon: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Center(
                                                child: Icon(
                                                  FontAwesomeIcons.minus,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            backgroundColor: Color.fromARGB(
                                                255, 218, 162, 16),
                                          ),
                                          Text(
                                            "$count",
                                            style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          FloatingActionButton.extended(
                                            onPressed: () {
                                              setState(() {
                                                count = count + 1;
                                              });
                                            },
                                            label: Text(
                                              "",
                                              style: GoogleFonts.roboto(
                                                  color: Colors.white),
                                            ),
                                            icon: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                            backgroundColor: Color.fromARGB(
                                                255, 218, 162, 16),
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
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          color:
                                              Color.fromARGB(255, 218, 162, 16),
                                          onPressed: () {
                                            setState(() {
                                              updateUser(count);
                                            });
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Vacation(
                                                          dc: dc,
                                                        )));
                                          },
                                          child: Center(
                                            child: Text("Book",
                                                style: GoogleFonts.roboto(
                                                  color: Colors.white,
                                                )),
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
                    );
                  })
              : CircularProgressIndicator();
        });
  }

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
          padding: const EdgeInsets.fromLTRB(75, 0, 0, 0),
          child: Text(
            "Flights",
            style: GoogleFonts.roboto(color: Colors.white),
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
          color: Colors.grey.shade200,
          child: list(),
        ),
      ),
    );  }
}
