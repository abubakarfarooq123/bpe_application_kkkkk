import 'package:bpe_application/id_verification/verification.dart';
import 'package:bpe_application/payment/payment.dart';
import 'package:bpe_application/profile_menu/frequent_location.dart';
import 'package:bpe_application/profile_menu/promo_code.dart';
import 'package:bpe_application/user/edit_profile.dart';
import 'package:bpe_application/user/login.dart';
import 'package:bpe_application/user/reset_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //top bar color
      systemNavigationBarColor: Colors.black, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0), // here the desired height
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 10, 0, 0),
            child: AppBar(
              title: Text("James Smith",
              style: GoogleFonts.limelight(
                color: Colors.white,
                fontSize: 20,
              ),
              ),
              leading: new Image.asset("assets/images/user.png"),
              backgroundColor: Colors.black,
              centerTitle: true,
            ),
          )
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
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: FlatButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Verification()));
                      },
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Icon(FontAwesomeIcons.idCard,
                          size: 25,),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                            child: Text(
                              "Verify Your ID",
                              style: GoogleFonts.limelight(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Promo()));

                    },
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Icon(FontAwesomeIcons.gift,
                            size: 25,),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
                          child: Text(
                            "Promo Code",
                            style: GoogleFonts.limelight(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Payment()));
                    },
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Icon(FontAwesomeIcons.wallet,
                            size: 25,),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
                          child: Text(
                            "Payment Method",
                            style: GoogleFonts.limelight(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: FlatButton(
                    onPressed: (){},
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Icon(FontAwesomeIcons.bell,
                            size: 25,),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(25, 10, 0, 10),
                          child: Text(
                            "Manage Notification",
                            style: GoogleFonts.limelight(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Edit_Profile()));
                    },
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Icon(FontAwesomeIcons.edit,
                            size: 25,),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                          child: Text(
                            "Edit Profile",
                            style: GoogleFonts.limelight(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Frequent_Location()));
                    },
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Icon(Icons.location_on,
                            size: 25,),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                          child: Text(
                            "Frequent Location",
                            style: GoogleFonts.limelight(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Reset_Password()));
                    },
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(5, 10, 0, 10),
                            child: Icon(Icons.lock_reset,
                            size: 25,),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Text(
                            "Reset Password",
                            style: GoogleFonts.limelight(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: FlatButton(
                    onPressed: (){},
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Icon(FontAwesomeIcons.question,
                            size: 25,),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(45, 10, 0, 10),
                          child: Text(
                            "F.A.Q",
                            style: GoogleFonts.limelight(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: FlatButton(
                    onPressed: (){},
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Icon(FontAwesomeIcons.file,
                            size: 25,),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(45, 10, 0, 10),
                          child: Text(
                            "Legal",
                            style: GoogleFonts.limelight(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: FlatButton(
                    onPressed: (){},
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Icon(FontAwesomeIcons.info,
                            size: 25,),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(45, 10, 0, 10),
                          child: Text(
                            "About",
                            style: GoogleFonts.limelight(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: FlatButton(
                    onPressed: (){},
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Icon(FontAwesomeIcons.phone,
                            size: 25,),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(25, 10, 0, 10),
                          child: Text(
                            "Call Help Desk",
                            style: GoogleFonts.limelight(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: FlatButton(
                    onPressed: () async=> {
                      await FirebaseAuth.instance.signOut(),
                      await storage.delete(key:"uid"),
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context)=> Login(),))
                    },
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Icon(Icons.logout,
                            size: 25,),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(45, 10, 0, 10),
                          child: Text(
                            "Log Out",
                            style: GoogleFonts.limelight(
                              color: Colors.black,
                              fontSize: 15,
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
