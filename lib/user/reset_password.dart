import 'package:bpe_application/splashscreens/resetsplash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Reset_Password extends StatefulWidget {
  const Reset_Password({Key? key}) : super(key: key);

  @override
  State<Reset_Password> createState() => _Reset_PasswordState();
}

class _Reset_PasswordState extends State<Reset_Password> {
  final _formkey = GlobalKey<FormState>();
  var password = "";
  final passwordController = TextEditingController();

  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
  final currentUser = FirebaseAuth.instance.currentUser;
  changepassword() async{
    try{
      await currentUser?.updatePassword(password);
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Resetsplash()));
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.amber,
            content: Text("Your Password has been changed",
            style: GoogleFonts.limelight(
            fontSize: 15,
              color: Colors.white,
            ),
            ),
      ));
      }catch(error){

    }
  }
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
        title: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: Text(
            "Reset Password",
            style: GoogleFonts.limelight(
              fontSize: 20,
            ),
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 60, 10, 0),
                  child: Image.asset(
                    "assets/images/reset-key.jpeg",
                    height: 250,
                    width: 250,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Form(
                    key: _formkey,

                    child: Column(
                      children: [
                        TextFormField(
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'New Password',
                            icon: Icon(
                              Icons.lock_reset,
                              color: Color.fromARGB(255, 218, 162, 16),
                            ),
                          ),
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                  ),
                SizedBox(
                  height: 80,
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
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          password = passwordController.text;
                        });
                      }
                      changepassword();
                    },
                    child: Text(
                      'Change Password',
                      style: GoogleFonts.limelight(
                        fontSize: 17.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                  ]
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
