import 'package:bpe_application/home/calender.dart';
import 'package:bpe_application/navbar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
class Flight extends StatefulWidget {
  const Flight({Key? key}) : super(key: key);

  @override
  State<Flight> createState() => _FlightState();
}

class _FlightState extends State<Flight> {
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
          padding: const EdgeInsets.fromLTRB(70,0,0,0),
          child: Text("Flights"),
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
        child: TicketView(),
      ),
    ),
    ),
    );
  }
}
class TicketView extends StatefulWidget {
  const TicketView({Key? key}) : super(key: key);

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text("From",
                        style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    Text("To",
                      textAlign: TextAlign.end,
                      style: GoogleFonts.raleway(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Atlanta",style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
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
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 24,
                            child:
                            LayoutBuilder(builder: (context,constraints){
                              return Flex(
                                children:
                                List.generate((constraints.constrainWidth()/6).floor(), (index) =>
                                    SizedBox(height: 1,width: 3,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(color: Colors.grey.shade300),),)
                                ),
                                direction: Axis.horizontal,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              );
                            },
                            ),
                          ),
                          Center(child: Transform.rotate(angle: 1, child: Icon(Icons.local_airport, color: Colors.black, size: 24,))),
                        ],
                      ),
                    ),),
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
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text("Mexico",style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text("Kata",
                        style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Text("Puerto Vallarta ",
                        textAlign: TextAlign.end,
                        style: GoogleFonts.raleway(
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
              height: 300,
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
                      Text("Garza Blanca Preserve Resort & Spa",
                          style: GoogleFonts.raleway(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(70, 15, 0, 0),
                            child: Icon(Icons.location_on, size: 15,color: Colors.black,),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                            child: Text("Puerto Vallarta, Mexico",
                              textAlign: TextAlign.end,
                              style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(150, 20, 0, 0),
                        child: Text("80 Dollars per day",style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text("Reviews",style: GoogleFonts.raleway(
                        color: Colors.black26,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
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
                            style: GoogleFonts.raleway(
                              color: Colors.black,
                              fontSize: 10,
                          ),
                      ),
                        ),
                            ],
                        ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 200, 0),
                        child: Text("Description",
                        style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Text("Hotel located in mexico and already had recomendation from mexico..........",
                          style: GoogleFonts.raleway(
                            color: Colors.black,
                          ),
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
              height: 130,
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
               Row(
                 children: [
                   Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                   child: Text("Total price",
                   style: GoogleFonts.raleway(
                     fontSize: 15,
                     fontWeight: FontWeight.bold,
                     color: Colors.black,
                   ),
                   ),
                   ),
                   Padding(padding: EdgeInsets.fromLTRB(122, 10, 0, 0),
                     child: Text("1329 Dollars",
                       style: GoogleFonts.raleway(
                         fontSize: 15,
                         fontWeight: FontWeight.bold,
                         color: Colors.black,
                       ),
                     ),
                   ),
                 ],
               ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 15, 70, 0),
                    child: Text("Include 3 days stay in resort",
                      style: GoogleFonts.raleway(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 50,
            width: 320,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Color.fromARGB(255, 218, 162, 16),
              onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Calender())); },
              child: Center(
                child: Text(
                  "Book",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


