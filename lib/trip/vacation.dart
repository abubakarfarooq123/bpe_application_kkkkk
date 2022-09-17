import 'package:bpe_application/payment/payment.dart';
import 'package:bpe_application/user/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
class Vacation extends StatefulWidget {
  final dc;
  Vacation({required this.dc});

  @override
  State<Vacation> createState() => _VacationState();
}

class _VacationState extends State<Vacation> {

  String formatted(timestamp){
    var dateFromTimeStamp = DateTime.fromMillisecondsSinceEpoch(timestamp.seconds* 1000);
    return DateFormat('dd-MM-yyyy').format(dateFromTimeStamp);
  }

  var name = '';
  book() async {
    await FirebaseFirestore.instance
        .collection('AddBooking')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("MyBook").
    add({
      'from': widget.dc.get('from'),
      'to': widget.dc.get('to'),
      'city1': widget.dc.get('city1'),
      'city2': widget.dc.get('city2'),
      'date': widget.dc.get('date'),
      'passenger': widget.dc.get('passenger'),
      'enddate': widget.dc.get('enddate'),
      'name': name,
    })
        .then((value) => print('User Added'))
        .catchError((error) => print('Falied to add user: $error'));
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
          padding: const EdgeInsets.fromLTRB(40,0,0,0),
          child: Text("Vacation Plan",
          style: GoogleFonts.roboto(
            fontSize: 25,

          ),),
        ),
      ),
      body:SingleChildScrollView(
    child: FutureBuilder<DocumentSnapshot>(
    future: FirebaseFirestore.instance
        .collection('registration')
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
    name = data!['name'];
    return ClipRRect(
      borderRadius: new BorderRadius.only(
        topLeft: const Radius.circular(40.0),
        topRight: const Radius.circular(40.0),
      ),
      child: SingleChildScrollView(
        child: Container(
          height: 900.0,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                child: Image.asset("assets/images/bpeair.jfif",
                  height: 150,
                  width: 350,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(13, 15, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "BPE Air",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 13
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 270, 10),
                    child: Text("Itinerary",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                        child: Text(
                          formatted(widget.dc.get('date')),
                          textAlign: TextAlign.end,
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(190, 15, 0, 0),
                        child: Text(
                          formatted(widget.dc.get('enddate')),
                          textAlign: TextAlign.end,
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 13,
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
                        padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                        child: Text(
                          "12:00 PM",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(65, 5, 0, 0),
                        child: Text(
                          "EFT 0h 21m",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(75, 5, 0, 0),
                        child: Text("12:21 PM",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 13,
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
                        padding: const EdgeInsets.fromLTRB(18, 15, 0, 0),
                        child: Text(
                          widget.dc.get('city1'),
                          textAlign: TextAlign.end,
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(145, 15, 0, 0),
                        child: Text(
                          widget.dc.get('city2'),
                          textAlign: TextAlign.end,
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 3,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    child: Image.asset("assets/images/plane4.jpg",
                      height: 150,
                      width: 350,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),

                  SizedBox(height: 4),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(right:110,top: 20),
                        child: Text(
                          "BPE Air Provides you with the best :",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10,left: 10),
                        child: Text(
                          "BPE provide a complete trip package. It provides 4 days trip plan with stay in 5 star hotel. BPE Air offers their guests the highest levels of luxury through personalized services, a vast range of amenities, and sophisticated accommodations.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                      ),

                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.black,
                thickness: 3,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(22, 10, 0, 0),
                        child: Text("Total price",
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(185, 10, 0, 0),
                        child: Text("8000",
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 25, 165, 0),
                    child: Text("Include 4 days stay in resort",
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 40,
                width: 340,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Color.fromARGB(255, 218, 162, 16),
                  onPressed: () {
                    setState(() {
                      book();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Payment()));
                    });
                  },
                  child: Center(
                    child: Text(
                      "Book",
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );

    },
    ),
      ),


    );
  }
}
