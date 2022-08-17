import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class Forget extends StatefulWidget {
  const Forget({Key? key}) : super(key: key);

  @override
  _ForgetState createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black ,
        elevation: 8.0,
        centerTitle: true,
        title: Text(
          "Reset your password",
          style: GoogleFonts.limelight(
            fontSize: 15.0,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.reply,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
          SizedBox(
          height: 7,
        ),
          Container(
            height: 200,
            width: 400,
            decoration: new BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
               child:  Padding(
                  padding: const EdgeInsets.fromLTRB(20, 60, 10, 10),
                  child: Text("Enter your Email below, we’ll send you a verify code to your email",
                    style: GoogleFonts.limelight(
                      fontSize: 13,
                    ),
                  ),
                ),
          ),
        SizedBox(height: 7),
        Container(
            height: 800,
            
            decoration: new BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          child: Form(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: 'Email ID',
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    child: Column(children: [
                    Container(
                      child: Image.asset("assets/images/pass.png",
                      height: 250,
                      width: 250,),
                    ),
                    SizedBox(height: 30),
                    Container(
                    margin: EdgeInsets.only(left: 80.0, right: 80, top: 0),
                    child: FlatButton(
                      onPressed: () {

                      },
                      color: Color.fromARGB(255, 218, 162, 16),
                      child: Text(
                        "Send Email",
                        style: GoogleFonts.limelight(color: Colors.white, fontSize: 13.0),
                      ),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(100.0)),
                      height: 40.0,
                    ),
                  ),
                ]),
              ),
            ],
            ),
          ),
        ),
    ),
    ]
    ),
      ),
    );
  }
}
