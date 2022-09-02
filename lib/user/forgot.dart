import 'package:bpe_application/splashscreens/forgotsplash.dart';
import 'package:bpe_application/user/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';


class Forget extends StatefulWidget {
  const Forget({Key? key}) : super(key: key);

  @override
  _ForgetState createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  final _formkey = GlobalKey<FormState>();
  var email="";
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
  resetpassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.orangeAccent,
        content: Text(
          'Password has been sent to your Email',
          style: GoogleFonts.limelight(
            fontSize: 15.0,
            color: Colors.white,
          ),
        ),
      ));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Fwaiting()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'No User found for that Email',
            style: GoogleFonts.limelight(
              fontSize: 15.0,
              color: Colors.white,
            ),
          ),
        ));
      }
    }
  }
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
            key: _formkey,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15.0,
                        ),
                      ),
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter the Email';
                        } else if (!value.contains('@')) {
                          return 'Please Enter Valid Email';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    margin: EdgeInsets.only(left: 80.0, right: 80, top: 0),
                    child: FlatButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            email = emailController.text;
                          });
                          resetpassword();
                        }
                      }, color: Color.fromARGB(255, 218, 162, 16),
                      child: Text(
                        "Send Email",
                        style: GoogleFonts.limelight(color: Colors.white, fontSize: 13.0),
                      ),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(100.0)),
                      height: 50.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    child: Column(children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25,100,0,0),
                          child: Container(
                              child: Image.asset("assets/images/logo-removebg-preview.png"),
                            height: 250,
                            width: 250,
                          ),
                        ),
                      ]
                    ),

                      SizedBox(height: 30),
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
