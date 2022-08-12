import 'package:bpe_application/demo_pages/demo2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: SingleChildScrollView(
    child: Column(
    children: <Widget>[
        Padding(
        padding: const EdgeInsets.fromLTRB(40, 100, 20, 0),
              child: Text(
                "Make trip planning easier and book faster with BPE",
                style: GoogleFonts.raleway(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                   ),
              ),
      SizedBox(
        height: 20,
      ),
      Container(
        child: Image.asset("assets/images/people.png"),
      ),
      SizedBox(
        height: 100,
      ),
      Container(
          height: 50,
          width: 320,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
           ),
            color: Colors.yellow[700],
            onPressed: () { Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Demo2())); },
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
    ],
        ),
    ),
    );
  }
}
