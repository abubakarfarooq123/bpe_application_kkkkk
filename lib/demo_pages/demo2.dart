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
      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[
        Padding(
        padding: const EdgeInsets.fromLTRB(30, 100, 20,0),
        child: Container(
        child: Image.asset("assets/images/plane.png"),
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
                                    child: new Text("Book a seat or whole plane",
                                    style: GoogleFonts.raleway(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    ),
                                    ),
                                  ),
                                  ),

                                  Padding(padding: EdgeInsets.all(18),
                                  child: Text("At BPE, You can book a single seat or whole plane. You have this flexible option in this BPE App ",
                        style: GoogleFonts.raleway(
                          fontSize: 12,
                          letterSpacing: 1,
                            color: Colors.white,
                        ),
                        ),
                                  ),
                                  SizedBox(
                                      height: 16
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
                                              builder: (context) => Demo3())); },
                                      child: Center(
                                        child: Text(
                                          "Next",
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
