import 'package:bpe_application/home/home_navbar_screen.dart';
import 'package:bpe_application/user/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class PromoDialog extends StatefulWidget {
  const PromoDialog({Key? key}) : super(key: key);

  @override
  State<PromoDialog> createState() => _PromoDialogState();
}

class _PromoDialogState extends State<PromoDialog> {
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Thanks for sharing the code",
                  style: GoogleFonts.limelight(
                    color: Colors.black,
                    fontSize: 12,
                  ),),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                 "We received your code. Our team will check it out and come back to you in a bit on this.",
                    style: GoogleFonts.limelight(
                      color: Colors.black,
                      fontSize: 12,
                    ),),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                  "Thanks For Using BPE Air",
                    style: GoogleFonts.limelight(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => homeNavBar()));
                    },
                    child: Text("Continue",
                      style: GoogleFonts.limelight(
                        color: Colors.black,
                        fontSize: 12,
                      ),),
                  ),
                ),
              ],
            ),
          ),
    ],
    );
  }
  }
