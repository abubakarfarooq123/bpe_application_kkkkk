import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
class Promo extends StatefulWidget {
  const Promo({Key? key}) : super(key: key);

  @override
  State<Promo> createState() => _PromoState();
}

class _PromoState extends State<Promo> {
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
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "Register",
            style: GoogleFonts.limelight(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
        body: ClipRRect(
        borderRadius: new BorderRadius.only(
        topLeft: const Radius.circular(40.0),
    topRight: const Radius.circular(40.0),
    ),
    child: Container(
    height: double.infinity,
    width: double.infinity,
    color: Colors.white,
    child: SingleChildScrollView(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
    Padding(padding: EdgeInsets.fromLTRB(30, 30, 10, 0),
      child: Image.asset("assets/images/gift.jpg",
        height: 350,
        width: 350,),
    ),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 1, 15, 0),
            child: Text("Have BPE promo code?",
              textAlign: TextAlign.justify,
              style: GoogleFonts.limelight(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
            child: Text("Lucky you, enter it below to redeem your private flighty reward.",
              style: GoogleFonts.limelight(
                  color: Colors.black,
                  fontSize: 13,
                  letterSpacing: 0.8
              ),
            ),
          ),
          Form(
              child:
                  Padding(
                    padding: const EdgeInsets.all(23.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Promo Code',
                      ),
                    ),
                  ),

    ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 40.0,
            width: 320.0,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Color.fromARGB(255, 218, 162, 16),
              onPressed: () {

              },
              child: Text(
                'Activate',
                style: GoogleFonts.limelight(
                  fontSize: 17.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),

        ],
    ),
      ]
    ),
    )
    ),
    ),
    );
  }
}