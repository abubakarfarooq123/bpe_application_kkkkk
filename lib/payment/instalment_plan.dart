import 'package:bpe_application/payment/installment.dart';
import 'package:bpe_application/trip/view_trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Installment_Plan extends StatefulWidget {
  const Installment_Plan({Key? key}) : super(key: key);

  @override
  State<Installment_Plan> createState() => _Installment_PlanState();
}

class _Installment_PlanState extends State<Installment_Plan> {
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
            "Installment Plan",
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
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Image.asset("assets/images/plan.png",
                  height: 350,
                  width: 350,)
                ),
                Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Text("BPE Air provides you with installment plan so you can pay half payment a month before the flight and half just before taking off.",
                textAlign: TextAlign.justify,
                  style: GoogleFonts.limelight(
                  color: Colors.black,
                  fontSize: 13,
                    letterSpacing: 0.5
                ),
                ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Row(
                  children: [
                    Text("Pay Full Expenses",
                      style: GoogleFonts.limelight(
                        color: Colors.black,
                        fontSize: 13
                      ),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    IconButton(onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewTrip()));
                    },
                        icon:Icon(
                            Icons.arrow_circle_right,
                          size: 35,
                        ),
                    ),
                  ],
                ),
                ),
            Padding(padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
              child: Row(
                children: [
                  Text("Pay in Installment",
                    style: GoogleFonts.limelight(
                        color: Colors.black,
                        fontSize: 13
                    ),
                  ),
                  SizedBox(
                    width: 140,
                  ),
                  IconButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Installment()));
                  },
                    icon:Icon(
                      Icons.arrow_circle_right_outlined,
                      size: 35,
                    ),
                  ),
                ],
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
