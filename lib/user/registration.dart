import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
          style: GoogleFonts.raleway(
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
          height: 800.0,
          width: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 0, 10),
                        child: Text("BPE",
                        style: GoogleFonts.raleway(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 60, 0, 10),
                        child: Text("Fill in your full information here to register",
                          style: GoogleFonts.raleway(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ),
            SizedBox(
              height: 7,
            ),
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

              child: new Form(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Name',
                              icon: Icon(
                                FontAwesomeIcons.user,
                                color: Color.fromARGB(255, 218, 162, 16),
                              ),
                            ),
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Email ID',
                              errorStyle: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 15.0,
                              ),
                              icon: Icon(
                                FontAwesomeIcons.envelope,
                                color: Color.fromARGB(255, 218, 162, 16),
                              ),
                            ),
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Phone',
                              icon: Icon(
                                FontAwesomeIcons.phone,
                                color: Color.fromARGB(255, 218, 162, 16),
                              ),
                            ),
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Password',
                            icon: Icon(
                              FontAwesomeIcons.lock,
                              color: Color.fromARGB(255, 218, 162, 16),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            icon: Icon(
                              FontAwesomeIcons.userLock,
                              color: Color.fromARGB(255, 218, 162, 16),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                            'Register',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Already Have an Accound? "),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 218, 162, 16),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
