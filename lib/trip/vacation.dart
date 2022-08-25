import 'package:bpe_application/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
class Vacation extends StatefulWidget {
  const Vacation({Key? key}) : super(key: key);

  @override
  State<Vacation> createState() => _VacationState();
}

class _VacationState extends State<Vacation> {
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
                          style: GoogleFonts.limelight(
                            color: Colors.black,
                            fontSize: 13
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(200, 0, 0, 0),
                          child: Text(
                            "1390 Dollars",
                            style: GoogleFonts.limelight(
                                color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 255, 10),
                        child: Text("Itinerary",
                          style: GoogleFonts.limelight(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                            child: Text(
                              "14 September 2022",
                              textAlign: TextAlign.end,
                              style: GoogleFonts.limelight(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(80, 15, 0, 0),
                            child: Text("14 September 2022",
                              textAlign: TextAlign.end,
                              style: GoogleFonts.limelight(
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
                              style: GoogleFonts.limelight(
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
                              style: GoogleFonts.limelight(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(75, 5, 0, 0),
                            child: Text("12:21 PM",
                              textAlign: TextAlign.end,
                              style: GoogleFonts.limelight(
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
                              "OPKC",
                              textAlign: TextAlign.end,
                              style: GoogleFonts.limelight(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(100, 15, 0, 0),
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
                            padding: const EdgeInsets.fromLTRB(95, 15, 0, 0),
                            child: Text("OPKC",
                              textAlign: TextAlign.end,
                              style: GoogleFonts.limelight(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(18, 15, 0, 0),
                            child: Text(
                              "Mexico Punta Mita",
                              textAlign: TextAlign.end,
                              style: GoogleFonts.limelight(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(90, 15, 0, 0),
                            child: Text(
                              "Atlanta Georgia",
                              textAlign: TextAlign.end,
                              style: GoogleFonts.limelight(
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
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(150, 20, 0, 0),
                            child: Text("80 Dollars per day",style: GoogleFonts.limelight(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text("Reviews",style: GoogleFonts.limelight(
                            color: Colors.black26,
                            fontSize: 13,
                          ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(110, 5, 0, 0),
                                child: Icon(Icons.star_border, color: Colors.black, size: 20,),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 30, 0),
                                child: Text("3.7  | 728 reviews total",
                                  textAlign: TextAlign.end,
                                  style: GoogleFonts.limelight(
                                    color: Colors.black,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 250, 0),
                            child: Text("Description",
                              style: GoogleFonts.limelight(
                                  color: Colors.black,
                                fontSize: 15
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Text("Hotel located in mexico and already had recomendation from mexico..........",
                              style: GoogleFonts.limelight(
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
                                  style: GoogleFonts.limelight(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.fromLTRB(185, 10, 0, 0),
                                child: Text("1329 Dollars",
                                  style: GoogleFonts.limelight(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(10, 25, 150, 0),
                              child: Text("Include 3 days stay in resort",
                                style: GoogleFonts.limelight(
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
                      onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Payment())); },
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
}
