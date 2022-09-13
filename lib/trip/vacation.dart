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

  book() async {
    await FirebaseFirestore.instance
        .collection('Book')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("MyBook").doc()
        .set({
      'from': widget.dc.get('from'),
      'to': widget.dc.get('to'),
      'city1': widget.dc.get('city1'),
      'city2': widget.dc.get('city2'),
      'description': widget.dc.get('description'),
      'total': widget.dc.get('total'),
      'date': widget.dc.get('date'),
      'passenger': widget.dc.get('passenger'),
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
                            padding: const EdgeInsets.fromLTRB(80, 15, 0, 0),
                            child: Text("14 September 2022",
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
                            padding: const EdgeInsets.fromLTRB(120, 15, 0, 0),
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
                            padding: const EdgeInsets.fromLTRB(0, 30, 270, 0),
                            child: Text("Description",
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                fontSize: 15
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Text(widget.dc.get('description'),
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 13
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
                                child: Text(widget.dc.get('total'),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Payment()));
                          book();
                          check();
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
        ),


    );
  }
 void check(){
    if(FirebaseAuth.instance.currentUser != null){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Payment()
      ));
    }else{
      AlertDialog(
        content: Text(
          "You need to login First"
      ),
        actions: [ FlatButton(
          onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Login()));
          },
          child: Text(
            "Go Login First"
          )
        )
   ]
      );
    }
  }
}
