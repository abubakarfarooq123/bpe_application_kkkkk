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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 100,10, 0),
              child: Container(
                child: new RotationTransition(
                    turns: new AlwaysStoppedAnimation(-15 / 360),
                    child: Image.asset("assets/images/plane2.png",
                    height: 300,
                    width: 300,)
              ),
            ),
            ),
            SizedBox(
              height: 70,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 40, 40,0),
                  child : new Container(
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
                                child: new Text("Power to choose",
                                  style: GoogleFonts.raleway(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),

                            Padding(padding: EdgeInsets.all(18),
                              child: Text("Choose, Where you want to travel all around the globe and how you want to travel, check prices and go for the one you like.",
                                style: GoogleFonts.raleway(
                                    fontSize: 12,
                                    letterSpacing: 1,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
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
                                    "Let's Go",
                                    style: TextStyle(
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
          ],
        ),
      ),
    );
  }
}
