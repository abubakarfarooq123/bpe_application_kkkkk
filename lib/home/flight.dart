import 'package:bpe_application/home/calender.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Flight extends StatefulWidget {
  final dc;
  Flight({required this.dc});

  @override
  State<Flight> createState() => _FlightState();
}

class _FlightState extends State<Flight> {
  final _formkey = GlobalKey<FormState>();
  var description = '';
  var total = '';

  book() async {
    await FirebaseFirestore.instance
        .collection('Book')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
          'from': widget.dc.get('from'),
          'to': widget.dc.get('to'),
          'city1': widget.dc.get('city1'),
          'city2': widget.dc.get('city2'),
          'description': description,
          'total': total,
          'date':"",
          'pessenger':"",
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
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
            child: Text(
              "Services",
              style: GoogleFonts.roboto(
                fontSize: 25,
              ),
            ),
          ),
        ),
        body: FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('AddHotel')
                .doc(FirebaseAuth.instance.currentUser!.uid)
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
              description = data!['description'];
              total = data['total'];

              return ClipRRect(
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                ),
                child: Container(
                  height: 800.0,
                  width: double.infinity,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 130,
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        "From",
                                        style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "To",
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
                                      widget.dc.get('from'),
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
                                      widget.dc.get('to'),
                                      style: GoogleFonts.roboto(
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        widget.dc.get('city1'),
                                        style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      child: Text(
                                        widget.dc.get('city2'),
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 350,
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
                                      SizedBox(height: 4),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [


                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 0),
                                            child: Center(
                                              child: Text(
                                                "BPE Services",
                                                style: GoogleFonts.roboto(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10),
                                            child: Column(
                                              children:[
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 15,left: 15),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                          String.fromCharCode(0x2022),
                                                      ),
                                                      SizedBox(
                                                        width: 30,
                                                      ),
                                                      Text(
                                                        "4 Days Vacation Plan",
                                                        style: GoogleFonts.roboto(
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 15,left: 15),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        String.fromCharCode(0x2022),
                                                      ),
                                                      SizedBox(
                                                        width: 30,
                                                      ),
                                                      Text(
                                                          "Stay in 5 Star Hotels/Resorts",
                                                        style: GoogleFonts.roboto(
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 15,left: 15),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        String.fromCharCode(0x2022),
                                                      ),
                                                      SizedBox(
                                                        width: 30,
                                                      ),
                                                      Text(
                                                          "Best Meal",
                                                        style: GoogleFonts.roboto(
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 20, 10, 0),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 230),
                                                  child: Text(
                                                    "Info.",
                                                    style: GoogleFonts.roboto(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 20
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  description,
                                                  textAlign: TextAlign.justify,
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.black,
                                                      fontSize: 13,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                                ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: Container(
                              height: 80,
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
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 15, 0, 0),
                                        child: Text(
                                          "Total",
                                          style: GoogleFonts.roboto(
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(165, 15, 0, 0),
                                        child: Text(
                                          total+" "+" Dollars",
                                          style: GoogleFonts.roboto(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 40,
                            width: 320,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              color: Color.fromARGB(255, 218, 162, 16),
                              onPressed: () {
                                setState(() {
                                  book();
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Calender()));
                              },
                              child: Center(
                                child: Text(
                                  "Book",
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
            }));
  }
}
class MyBullet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 5.0,
      width: 5.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}