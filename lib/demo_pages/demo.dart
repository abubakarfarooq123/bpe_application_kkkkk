import 'package:bpe_application/demo_pages/demo2.dart';
import 'package:bpe_application/demo_pages/demo4.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/plane3.jpg"),
              fit: BoxFit.cover,
            ),
          ),
    child: Column(
    children: <Widget>[
        Padding(
        padding: const EdgeInsets.fromLTRB(40, 70, 20, 0),
              child: Text(
                "Make trip planning easier and safer with BPE Air.",
                style: GoogleFonts.limelight(
                  fontSize: 17.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                   ),
              ),
      Column(
        children:[
          Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100, 270, 100, 0),
              child: Text(
              "BPE Air.",
              style: GoogleFonts.limelight(
                fontSize: 17.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
          SizedBox(
            height: 5,
          ),
          Center(
        child: Text(
                "The best host for the journey",
                style: GoogleFonts.limelight(
                  fontSize: 10.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
      SizedBox(
        height: 30,
      ),
      SizedBox(
        height: 220,
      ),
      Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
              child: FlatButton(
                onPressed: () { Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Demo4())); },
                child: Center(
                  child: Text(
                    "Skip",
                    style: GoogleFonts.limelight(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),

        Padding(
              padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
              child: FlatButton(
                    onPressed: () { Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Demo2())); },
                    child: Center(
                    child: Text(
                      "Next",
                      style: GoogleFonts.aBeeZee(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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
