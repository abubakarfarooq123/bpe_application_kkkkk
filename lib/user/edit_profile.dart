import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
class Edit_Profile extends StatefulWidget {
  const Edit_Profile({Key? key}) : super(key: key);

  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  var imageFile;
  var image;
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
              "Edit Profile",
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
    padding: EdgeInsets.only(top: 40.0),
      child: new Stack(
        fit: StackFit.loose,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              imageFile != null
                  ? CircleAvatar(
                radius: 80.0,
                backgroundImage: FileImage(imageFile!),
              )
                  : image != ''
                  ? CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage("assets/images/user.png"),
              )
                  : CircleAvatar(
                radius: 80.0,
                backgroundColor: Colors.black,
                backgroundImage: AssetImage(
                    'assets/images/user.png'),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 130.0, left: 90.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: ((builder) => bottomSheet()),
                    );
                  },
                  child: Icon(
                    Icons.camera_alt,
                    color: Color.fromARGB(255, 218, 162, 16),
                    size: 35.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Name',
                icon: Icon(
                  FontAwesomeIcons.user,
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
                hintText: 'Email',
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
              decoration: InputDecoration(
                hintText: 'Phone',
                icon: Icon(
                  FontAwesomeIcons.phone,
                  color: Color.fromARGB(255, 218, 162, 16),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 130,
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
      ],
    ),

    ),
    ),
        ),
    );
  }
}


Widget bottomSheet() {
  return Container(
    height: 80.0,
    width: double.infinity,
    margin: EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    child: Column(
      children: <Widget>[
        Text(
          "Choose Profile photo",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        SizedBox(
          height: 7.0,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          FlatButton.icon(
            icon: Icon(
              Icons.camera,
              color: Colors.teal[700],
              size: 30.0,
            ),
            onPressed: () {
            },
            label: Text("Camera"),
          ),
          SizedBox(
            width: 40.0,
          ),
          FlatButton.icon(
            icon: Icon(
              Icons.image,
              color: Colors.teal[700],
              size: 30.0,
            ),
            onPressed: () {
            },
            label: Text("Gallery"),
          ),
        ])
      ],
    ),
  );
}

