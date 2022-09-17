import 'package:bpe_application/home/home_navbar_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Trip extends StatefulWidget {
  const Trip({Key? key}) : super(key: key);

  @override
  State<Trip> createState() => _TripState();
}

class _TripState extends State<Trip> {
  String formatted(timestamp) {
    var dateFromTimeStamp =
        DateTime.fromMillisecondsSinceEpoch(timestamp.seconds * 1000);
    return DateFormat('dd-MM-yyyy').format(dateFromTimeStamp);
  }
  Widget list() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("AddBooking")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("MyBook")
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData){
          if(snapshot.data?.docs.length==0){
            return  Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(top:30,left: 20,right: 20),
                  child: Image.asset('assets/images/lv.png',
                  height: 450,
                  width: 450,),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    height: 50.0,
                    width: 120.0,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Color.fromARGB(255, 218, 162, 16),
                      onPressed: (){
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => homeNavBar()));
                    }, child: Text(
        'Book Flight',
        style: GoogleFonts.roboto(
        fontSize: 15.0,
        color: Colors.white,
        ),
                    ),
                    ),
                  ),
                ),
              ],
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot dc = snapshot.data!.docs[index];
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15,left: 10,right: 10),
                  child: Container(
                    height: 100,
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
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  dc["city1"],
                                  style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Text(
                                dc["city2"],
                                textAlign: TextAlign.end,
                                style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                formatted(dc["date"]),
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight:FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.indigo.shade50,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: SizedBox(
                                  height: 8,
                                  width: 8,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius:
                                      BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        height: 24,
                                        child: LayoutBuilder(
                                          builder:
                                              (context, constraints) {
                                            return Flex(
                                              children: List.generate(
                                                  (constraints.constrainWidth() /
                                                      6)
                                                      .floor(),
                                                      (index) => SizedBox(
                                                    height: 1,
                                                    width: 3,
                                                    child:
                                                    DecoratedBox(
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey
                                                              .shade300),
                                                    ),
                                                  )),
                                              direction: Axis.horizontal,
                                              mainAxisSize:
                                              MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                            );
                                          },
                                        ),
                                      ),
                                      Center(
                                          child: Transform.rotate(
                                              angle: 1,
                                              child: Icon(
                                                Icons.local_airport,
                                                color: Colors.black,
                                                size: 24,
                                              ))),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.pink.shade50,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: SizedBox(
                                  height: 8,
                                  width: 8,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius:
                                      BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                formatted(dc["enddate"]),
                                style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold
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
            },
          );
        }
        else{
          return CircularProgressIndicator();

        }
      },
    );
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
          padding: const EdgeInsets.fromLTRB(120, 0, 0, 0),
          child: Text(
            "My Booking",
            style: GoogleFonts.roboto(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ClipRRect(
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
      ),
    );
  }
}
