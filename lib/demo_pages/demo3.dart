import 'package:bpe_application/demo_pages/demo4.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Demo3 extends StatelessWidget {
  const Demo3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bagman.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Column(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(10, 50, 20, 0),
                child: Text(
                  " ”You are only one decision from a totally different life.” ",
                  style: GoogleFonts.limelight(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,right: 20),
                  child: Text(
                    "Fly with BPE Air today",
                    style: GoogleFonts.limelight(
                        color: Color .fromARGB(255, 51, 51, 51),
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 300, 40,0),
                child: new Container(
                  height: 205.0,
                  color: Colors.transparent,
                  child: new Container(
                    decoration: new BoxDecoration(
                        color: Color.fromARGB(255, 51, 51, 51),
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0),
                          bottomLeft: const Radius.circular(40.0),
                          bottomRight: const Radius.circular(40.0),
                        )
                    ),
                    child: Column(
                        children: [
                          new Padding(padding: EdgeInsets.all(20),
                            child : Center(
                              child: new Text("Power of  Decisions",
                                style: GoogleFonts.limelight(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),

                          Padding(padding: EdgeInsets.only(top: 5,left: 18,right: 18),
                            child: Text("Unsuccessful people make decisions based on their current situation; successful people make decisions based on where they want to be.” Make the right decision and fly with BPE Air.",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.limelight(
                                fontSize: 11,
                                color: Colors.white,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 34,
                          ),
                          Container(
                            height: 40,
                            width: 220,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              color: Color.fromARGB(255, 218, 162, 16),
                              onPressed: () { Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Demo4())); },
                              child: Center(
                                child: Text(
                                  "Next",
                                  style: GoogleFonts.limelight(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),
                ),
              ),

          ],
        ),

      ),
    );
  }
}
