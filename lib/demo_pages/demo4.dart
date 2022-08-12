import 'package:bpe_application/demo_pages/demo5.dart';
import 'package:bpe_application/user/login.dart';
import 'package:bpe_application/user/registration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Demo4 extends StatefulWidget {
  const Demo4({Key? key}) : super(key: key);

  @override
  State<Demo4> createState() => _Demo4State();
}

class _Demo4State extends State<Demo4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
        child: Column(
        children: <Widget>[
        Padding(
        padding: const EdgeInsets.fromLTRB(20,80,20,20),
          child:  Container(
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
                      builder: (context) => RegisterPage())); },
              child: Center(
                child: Text(
                  "Create Account",
                  style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,20,20,20),
            child:  Container(
              height: 50,
              width: 320,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.white,
                onPressed: () { Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Login())); },
                child: Center(
                  child: Text(
                    "Login",
                    style: GoogleFonts.raleway(
                      color: Color.fromARGB(255, 218, 162, 16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(40),
          child: Center(
          child: FlatButton(
            onPressed: () { Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Demo5())); },
            child: Text(
            "Later",
              style: GoogleFonts.raleway(
                color: Color.fromARGB(255, 218, 162, 16),
                fontWeight: FontWeight.w900,
              ),
          ),

          ),
          ),
          ),
          Padding(padding: EdgeInsets.all(40),
            child: Center(
              child: FlatButton(
                onPressed: () {  },
                child: Text(
                  "By Using BPE's service you must agree to our Terms and Conditions and Privacy Policy ",
                  style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontSize: 15,
                    letterSpacing: 2,
                  ),
                ),

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(150, 10, 0, 0),
            child: Container(
              child: Image.asset("assets/images/user.png"),
            ),
          ),
    ],
    ),
    ),
    );


    }
}

