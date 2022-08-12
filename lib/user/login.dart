import 'package:bpe_application/home/home.dart';
import 'package:bpe_application/user/forgot.dart';
import 'package:bpe_application/user/registration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
class Login  extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //top bar color
      systemNavigationBarColor: Colors.black, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 100, 250, 0),
                      child: Image.asset("assets/images/app_icon.jpeg",
                      height:100 ,
                      width: 100,),
                    ),
              Center(
                  child: Padding(padding: EdgeInsets.fromLTRB(10, 120, 190, 30),
                  child: Text(
                    "Welcome Back !!!",
                    style: TextStyle(
                      fontFamily: "Lato-Black",
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
    ),

                ],
                ),
            ),
            ClipRRect(
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0)),
              child: Container(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).size.height / 2.5,
                width: double.infinity,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: new Form(
                          child: Column(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.fromLTRB(10, 20, 250, 10),
                              child: Text(
                                  "Login",
                                style: TextStyle(
                                  color: Colors.blue
                                ),
                              ),
                              ),
                              Padding(padding: EdgeInsets.fromLTRB(10, 20, 200, 10),
                                child: Text(
                                  "Email or Phone",
                                  style: TextStyle(
                                      color: Colors.black,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: TextFormField(
                                    autofocus: false,
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
                                    autofocus: false,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      errorStyle: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 15.0,
                                      ),
                                      icon: Icon(
                                        FontAwesomeIcons.lock,
                                        color: Color.fromARGB(255, 218, 162, 16),
                                      ),

                                    ),
                                    ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Center(
                                child: Container(
                                  height: 40.0,
                                  width: 340.0,
                                  // ignore: deprecated_member_use
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Home()));

                                    },
                                    color: Color.fromARGB(1000, 218, 162, 16),
                                    child: Text(
                                      'Login',
                                      style: GoogleFonts.raleway(
                                        fontSize: 18.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 10.0,
                              ),
                              Center(
                                child: Container(
                                  height: 40.0,
                                  width: 340.0,
                                  // ignore: deprecated_member_use
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Home()));
                                    },
                                    color: Color.fromARGB(200, 246, 232, 195),
                                    child: Text(
                                      'Guest',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Forget()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(3, 20, 210, 30),
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 218, 162, 16),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Don't have an account? ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegisterPage()));
                                      },
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 218, 162, 16),
                                        ),
                                      ),
                                    ),
                                  ],
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
          ],
        ),
      ),
    );

  }
}
