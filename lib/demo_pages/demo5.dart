import 'package:bpe_application/home/home.dart';
import 'package:bpe_application/navbar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
class Demo5 extends StatefulWidget {
  const Demo5({Key? key}) : super(key: key);

  @override
  State<Demo5> createState() => _Demo5State();
}

class _Demo5State extends State<Demo5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/plane6.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.white.withOpacity(0.5),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(132),
                  child: Text(
                    "Services",
                    style: GoogleFonts.roboto(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              Padding(padding: EdgeInsets.fromLTRB(15,0,20,0),
                child: Center(
                  child: Text("“The world is a book, and those who do not travel read only one page.” ",
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Text(
                      "Book Vacation package with: -",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: new MyBullet(),
                    title: new Text("Private Flights",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: new MyBullet(),
                    title: new Text("Resorts.",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 13,
                      ),),
                  ),
                  new ListTile(
                    leading: new MyBullet(),
                    title: new Text("5 Star Restaurants.",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: new MyBullet(),
                    title: new Text("Add Spliting Payments.",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                    child: Container(
                      height: 40.0,
                      width: 320.0,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Color.fromARGB(255, 218, 162, 16),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MyBottomNavyBar()));
                        },
                        child: Text(
                          'Get Started',
                          style: GoogleFonts.roboto(
                            fontSize: 18.0,
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

            ],
          ),
        ),
      ),
    );
  }
}



class MyBullet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: new Container(
        height: 5.0,
        width: 5.0,
        decoration: new BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

