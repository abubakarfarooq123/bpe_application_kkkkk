import 'package:bpe_application/demo_pages/demo4.dart';
import 'package:bpe_application/user/login.dart';
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
            image: AssetImage("assets/images/2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Column(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
                child: Text(
                  "Use Wisely your power of choose",
                  style: GoogleFonts.limelight(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                ),
                Text(
                  "with BPE Air",
                  style: GoogleFonts.limelight(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 320, 40,0),
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
                              child: new Text("Power to Choose",
                                style: GoogleFonts.limelight(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),

                          Padding(padding: EdgeInsets.all(18),
                            child: Text("Choose, Where you want to travel all around the globe and how you want to travel, check prices and go for the one you like.",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.limelight(
                                fontSize: 11,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
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
