import 'package:bpe_application/home/home_navbar_screen.dart';
import 'package:bpe_application/navbar/navbar.dart';
import 'package:bpe_application/user/forgot.dart';
import 'package:bpe_application/user/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
class Login  extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formkey = new GlobalKey<FormState>();
  var email = "";
  var password = "";

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final storage = new FlutterSecureStorage();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  userlogin() async {
    try {
      UserCredential userCredential= await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(userCredential.user?.uid);
      await storage.write(key: "uid", value: userCredential.user?.uid);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => homeNavBar(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'No User Found for that email',
            style: GoogleFonts.limelight(
              fontSize: 15.0,
              color: Colors.white,
            ),
          ),
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'Incorrect Password',
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
                height: 250,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 250, 0),
                        child: Image.asset("assets/images/app_icon.jpeg",
                        height:100 ,
                        width: 100,),
                      ),
                Center(
                    child: Padding(padding: EdgeInsets.fromLTRB(10, 40, 140, 30),
                    child: Text(
                      "Welcome Back !!!",
                      style:GoogleFonts.limelight(
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
                      MediaQuery.of(context).size.height / 3,
                  width: double.infinity,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: new Form(
                            key: formkey,
                            child: Column(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.fromLTRB(10, 10, 250, 10),
                                child: Text(
                                    "Login",
                                  style: GoogleFonts.limelight(
                                    color: Colors.black,
                                    fontSize: 14
                                  ),
                                ),
                                ),
                                Padding(padding: EdgeInsets.fromLTRB(25, 10, 130, 10),
                                  child: Text(
                                    "Email or Phone Number",
                                    style: GoogleFonts.limelight(
                                        color: Colors.black,
                                      fontSize: 14
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: TextFormField(
                                      autofocus: false,
                                      decoration: InputDecoration(
                                        hintText: 'Enter Email ID or number',
                                        errorStyle: GoogleFonts.limelight(
                                          color: Colors.redAccent,
                                          fontSize: 15.0,
                                        ),
                                        icon: Icon(
                                          FontAwesomeIcons.envelope,
                                          color: Color.fromARGB(255, 218, 162, 16),
                                        ),
                                      ),
                                      controller: emailController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter Email';
                                        } else if (!value.contains('@')) {
                                          return 'Please Enter Valid Email';
                                        }
                                        return null;
                                      }
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: TextFormField(
                                      autofocus: false,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        hintText: 'Password',
                                        errorStyle: GoogleFonts.limelight(
                                          color: Colors.redAccent,
                                          fontSize: 15.0,
                                        ),
                                        icon: Icon(
                                          FontAwesomeIcons.lock,
                                          color: Color.fromARGB(255, 218, 162, 16),
                                        ),
                                      ),
                                      controller: passwordController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter Password';
                                        }
                                        return null;
                                      }
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
                                        if (formkey.currentState!.validate()) {
                                          setState(() {
                                            email = emailController.text;
                                            password = passwordController.text;
                                          });
                                          userlogin();
                                        }
                                      },
                                      color: Color.fromARGB(1000, 218, 162, 16),
                                      child: Text(
                                        'Login',
                                        style: GoogleFonts.limelight(
                                          fontSize: 15.0,
                                          color: Colors.white,
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
                                                builder: (context) => MyBottomNavyBar()));
                                      },
                                      color: Color.fromARGB(200, 246, 224, 195),
                                      child: Text(
                                        'Guest',
                                        style: GoogleFonts.limelight(
                                          fontSize: 15.0,
                                          color: Colors.white,
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
                                    padding: const EdgeInsets.fromLTRB(3, 20, 180, 30),
                                    child: Text(
                                      'Forgot Password?',
                                      style: GoogleFonts.limelight(
                                        fontSize: 14.0,
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
                                      style: GoogleFonts.limelight(
                                        color: Colors.grey,
                                        fontSize: 14
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
                                          style: GoogleFonts.limelight(
                                            color: Color.fromARGB(255, 218, 162, 16),
                                            fontSize: 14
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
                        SizedBox(
                          height: 20,
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
