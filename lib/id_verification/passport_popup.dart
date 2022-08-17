import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Passport_Pop_Up extends StatefulWidget {
  const Passport_Pop_Up({Key? key}) : super(key: key);

  @override
  State<Passport_Pop_Up> createState() => _Passport_Pop_UpState();
}

class _Passport_Pop_UpState extends State<Passport_Pop_Up> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 100, bottom: 16, right: 16, left: 16),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child:
    Form(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children:[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Enter Name"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Date of Birth"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Date of Issue"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Date of Expiry"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Passport Number"),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(
                          context);
                    },
                    child: Text("Confirm"),
                  ),
                ),
  ],
    ),
                  ),

          ),
        Positioned(
          top: 40,
          left: 16,
          right: 16,
          child:Column(
            children: [
              Icon(FontAwesomeIcons.passport,
              size: 40,),
              SizedBox(height: 10,),
              Text("Passport Verification",style: GoogleFonts.limelight(
                color: Colors.black
              ),)
            ],
          )
          ),

      ],
    );
  }
}
