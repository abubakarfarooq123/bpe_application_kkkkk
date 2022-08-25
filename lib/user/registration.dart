import 'package:bpe_application/demo_pages/demo5.dart';
import 'package:bpe_application/home/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final _formKey = GlobalKey<FormState>();

  var name="";
  var email="";
  var phone="";
  var password="";
  var confirmPassword="";

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  @override
  void dispose(){
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  Future<void> adduser() async {
    print("UserEmail is :" + email);
    print('Values are ' + name + email + phone);
  }

  Future<User?> registration() async {
    if (password == confirmPassword) {
      try {
        User? user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email, password: password))
            .user;
        user?.updateProfile(displayName: name);
        await FirebaseFirestore.instance
            .collection('registration')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .set({
          'name': name,
          'email': email,
          'phone': phone,
          "uid": FirebaseAuth.instance.currentUser?.uid,
        })
            .then((value) => print('User Added'))
            .catchError((error) => print('Falied to add user: $error'));

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Demo5(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Password Provided is too weak',
              style: GoogleFonts.limelight(
                fontSize: 15.0,
                color: Colors.white,
              ),
            ),
          ));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Account already exists',
              style: GoogleFonts.limelight(
                fontSize: 15.0,
                color: Colors.white,
              ),
            ),
          ));
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          "Password and Conform Password Does'nt match",
          style: GoogleFonts.limelight(
            fontSize: 15.0,
            color: Colors.white,
          ),
        ),
      ));
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
                          child: Text("BPE Air",
                          style: GoogleFonts.limelight(
                            fontSize: 20,
                          ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 60, 0, 10),
                          child: Text("Register Today !!!!",
                            style: GoogleFonts.limelight(
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
                  key: _formKey,
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
                              controller: nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Name';
                                }
                                return null;
                              }),
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
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Email';
                                } else if (!value.contains('@')) {
                                  return 'Please Enter Valid Email';
                                }
                                return null;
                              }),
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
                              controller: phoneController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Phone';
                                }
                                return null;
                              }),

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
                              controller: passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Password';
                                }
                                return null;
                              }),

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
                              controller: confirmPasswordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Re-Enter Password';
                                }
                                return null;
                              }),

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
                              if (_formKey.currentState!.validate()){
                                setState(() {
                                  name = nameController.text;
                                  email = emailController.text;
                                  phone = phoneController.text;
                                  password = passwordController.text;
                                  confirmPassword = confirmPasswordController.text;
                                });
                                registration();
                              }

                            },
                            child: Text(
                              'Register',
                              style: GoogleFonts.limelight(
                                fontSize: 17.0,
                                color: Colors.white,
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
                                Text("Already Have an Accound? ",
                                style: GoogleFonts.limelight(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login()));
                                  },
                                  child: Text(
                                    "Login",
                                    style: GoogleFonts.limelight(
                                      color: Color.fromARGB(255, 218, 162, 16),
                                      fontSize: 13
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
