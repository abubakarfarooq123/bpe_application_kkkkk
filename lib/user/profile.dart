import 'package:bpe_application/id_verification/verification.dart';
import 'package:bpe_application/payment/payment.dart';
import 'package:bpe_application/profile_menu/frequent_location.dart';
import 'package:bpe_application/profile_menu/promo_code.dart';
import 'package:bpe_application/splashscreens/loginout.dart';
import 'package:bpe_application/user/edit_profile.dart';
import 'package:bpe_application/user/login.dart';
import 'package:bpe_application/user/reset_password.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  var name = '';
  String img = '';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
        .collection('registration')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get(),
    builder:
    (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (snapshot.hasError) {
        print('somthing went wrong');
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      var data = snapshot.data;
      name = data!['name'];
      img = data['Image'];

      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, //top bar color
        systemNavigationBarColor: Colors.black, //bottom bar color
        systemNavigationBarIconBrightness: Brightness.dark,
      ));
      return Scaffold(
        backgroundColor: Colors.black,
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
                  CustomPaint(
                    child: Container(
                      height: 20,
                    ),
                    painter: HeaderCurvedContainer(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          name,
                          style: GoogleFonts.roboto(
                            fontSize: 17,
                            letterSpacing: 1.5,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        child: CircleAvatar(
                            child: img != null
                                ? CircleAvatar(
                              radius: 80.0,
                              backgroundImage: NetworkImage(img),
                            )
                                : img != ''
                                ? CircleAvatar(
                              radius: 80.0,
                              backgroundImage: NetworkImage(img),
                            )
                                : CircleAvatar(
                              radius: 80.0,
                              backgroundColor: Colors.black,
                              backgroundImage:
                              AssetImage('assets/images/profile.png'),
                            )),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: FlatButton(
                      onPressed: () {
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
                            width: 80,
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                            child: Text(
                              "Verify Your ID",
                              style: GoogleFonts.roboto(
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
                      onPressed: () {
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
                            width: 80,
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
                            child: Text(
                              "Promo Code",
                              style: GoogleFonts.roboto(
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
                      onPressed: () {
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
                            width: 70,
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
                            child: Text(
                              "Payment Method",
                              style: GoogleFonts.roboto(
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
                      onPressed: () {},
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                            child: Icon(FontAwesomeIcons.bell,
                              size: 25,),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(25, 10, 0, 10),
                            child: Text(
                              "Manage Notification",
                              style: GoogleFonts.roboto(
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
                      onPressed: () {
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
                            width: 85,
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                            child: Text(
                              "Edit Profile",
                              style: GoogleFonts.roboto(
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
                      onPressed: () {
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
                            width: 65,
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                            child: Text(
                              "Frequent Location",
                              style: GoogleFonts.roboto(
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
                      onPressed: () {
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
                            width: 87,
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                            child: Text(
                              "Reset Password",
                              style: GoogleFonts.roboto(
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
                      onPressed: () {},
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                            child: Icon(FontAwesomeIcons.question,
                              size: 25,),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(45, 10, 0, 10),
                            child: Text(
                              "F.A.Q",
                              style: GoogleFonts.roboto(
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
                      onPressed: () {},
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                            child: Icon(FontAwesomeIcons.file,
                              size: 25,),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(45, 10, 0, 10),
                            child: Text(
                              "Legal",
                              style: GoogleFonts.roboto(
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
                      onPressed: () {},
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                            child: Icon(FontAwesomeIcons.info,
                              size: 25,),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(45, 10, 0, 10),
                            child: Text(
                              "About",
                              style: GoogleFonts.roboto(
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
                      onPressed: () {},
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                            child: Icon(FontAwesomeIcons.phone,
                              size: 25,),
                          ),
                          SizedBox(
                            width: 75,
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(25, 10, 0, 10),
                            child: Text(
                              "Call Help Desk",
                              style: GoogleFonts.roboto(
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
                      onPressed: () async =>
                      {
                        await FirebaseAuth.instance.signOut(),
                        await storage.delete(key: "uid"),
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => LoginOut(),))
                      },
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                            child: Icon(Icons.logout,
                              size: 25,),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(45, 10, 0, 10),
                            child: Text(
                              "Log Out",
                              style: GoogleFonts.roboto(
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
    );

  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.black;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}