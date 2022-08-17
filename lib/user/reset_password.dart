import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
class Reset_Password extends StatefulWidget {
  const Reset_Password({Key? key}) : super(key: key);

  @override
  State<Reset_Password> createState() => _Reset_PasswordState();
}

class _Reset_PasswordState extends State<Reset_Password> {
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
      Padding(padding: EdgeInsets.fromLTRB(10, 60, 10, 0),
      child: Image.asset("assets/images/lock.png",
      height: 250,
      width: 250,),
      ),
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: TextFormField(
          autofocus: false,
          decoration: InputDecoration(
            hintText: 'Current Password',
            icon: Icon(
              FontAwesomeIcons.userLock,
              color: Color.fromARGB(255, 218, 162, 16),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: TextFormField(
          autofocus: false,
          decoration: InputDecoration(
            hintText: 'New Password',
            icon: Icon(
              Icons.lock_reset,
              color: Color.fromARGB(255, 218, 162, 16),
            ),
          ),
        ),
      ),

      Padding(
        padding: const EdgeInsets.all(18.0),
        child: TextFormField(
          autofocus: false,
          decoration: InputDecoration(
            hintText: 'Retype Password',
            icon: Icon(
              FontAwesomeIcons.lock,
              color: Color.fromARGB(255, 218, 162, 16),
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
            'Change Password',
            style: GoogleFonts.limelight(
              fontSize: 17.0,
              color: Colors.white,
            ),
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
