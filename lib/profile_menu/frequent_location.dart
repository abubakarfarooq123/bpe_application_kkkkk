import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
class Frequent_Location extends StatefulWidget {
  const Frequent_Location({Key? key}) : super(key: key);

  @override
  State<Frequent_Location> createState() => _Frequent_LocationState();
}

class _Frequent_LocationState extends State<Frequent_Location> {
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
            "Frequent Location",
            style: GoogleFonts.limelight(
              fontSize: 17,
            ),
          ),
        ),
        actions :[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {  },
          ),
        ),
        ]
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
                Padding(padding: EdgeInsets.only(top: 50),
                child: IconButton(
                  icon: Icon(Icons.add_circle,
                  size: 60,color: Colors.yellow[700],),
                  onPressed: (){

                  },
                ),),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Center(
                    child: Text("Add Location",
                    style: GoogleFonts.limelight(
                      color: Colors.black,
                      fontSize: 15
                    ),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(40),
                  child: Center(
                    child: Text("If you would like to receive flight notifications for your favourite destinations, add them to your frequesnt locations list.Let us work our magic and we’ll get you there!",
                        textAlign: TextAlign.justify,
                      style: GoogleFonts.limelight(
                          color: Colors.black,
                          fontSize: 15,
                      ),),
                  ),
                ),
                SizedBox(
                  height: 280,
                ),
                Container(
                  height: 40.0,
                  width: 300.0,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Color.fromARGB(255, 218, 162, 16),
                    onPressed: () {
                      Navigator.pop(context);

                    },
                    child: Text(
                      'Update',
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
