import 'package:bpe_application/demo_pages/demo3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Demo2 extends StatelessWidget {
  const Demo2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/plane5.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(200, 50, 20, 0),
                child: Text(
                  "Book travel and enjoy with BPE Air.",
                  style: GoogleFonts.limelight(
                    fontSize: 17.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 410, 40, 0),
             child: new Container(
                  height: 200.0,
                  color: Colors.transparent,
                  child: new Container(
                    decoration: new BoxDecoration(
                        color: Color.fromARGB(255, 51, 51, 51),
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0),
                          bottomLeft: const Radius.circular(40.0),
                          bottomRight: const Radius.circular(40.0),
                        )),
                    child: Column(children: [
                      new Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(
                          child: new Text(
                            "Book a seat",
                            style: GoogleFonts.limelight(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(18, 12, 18, 18),
                        child: Text(
                          "At BPE Air, Book a whole vacation package, where you will get resort booking, 5 stars hotel and much more all at BPE Air.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.limelight(
                            fontSize: 11,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        height: 40,
                        width: 220,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Color.fromARGB(255, 218, 162, 16),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Demo3()));
                          },
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
                    ]),
                  ),
                ),
              ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
