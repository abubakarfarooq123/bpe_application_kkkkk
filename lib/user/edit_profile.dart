import 'dart:io';

import 'package:bpe_application/splashscreens/updateprofile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

class Edit_Profile extends StatefulWidget {
  const Edit_Profile({Key? key}) : super(key: key);

  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  // File? imageFile;
  // var downloadURL;
  String? url;
  uploadImage() async {
    final _firebaseStorage = FirebaseStorage.instance;
    final _imagePicker = ImagePicker();
    PickedFile image;

    //Check Permissions
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      //Select Image
      image = (await _imagePicker.getImage(source: ImageSource.gallery))!;
      var file = File(image.path);
      int uploadTimestamp = DateTime.now().millisecondsSinceEpoch;
      if (image != null) {
        Reference ref =
        _firebaseStorage.ref().child('profileImages/$uploadTimestamp');
        UploadTask uploadTask = ref.putFile(file);

        var imageUrl = await (await uploadTask).ref.getDownloadURL();
        setState(() {
          url = imageUrl.toString();
        });
      } else {
        print('No Image Path Received');
      }
    } else {
      print('Permission not granted. Try Again with permission access');
    }
  }
  addImage() async {
    final _firebaseStorage = FirebaseStorage.instance;
    final _imagePicker = ImagePicker();
    PickedFile image;

    //Check Permissions
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      //Select Image
      image = (await _imagePicker.getImage(source: ImageSource.camera))!;
      var file = File(image.path);
      int uploadTimestamp = DateTime.now().millisecondsSinceEpoch;
      if (image != null) {
        Reference ref =
        _firebaseStorage.ref().child('profileImages/$uploadTimestamp');
        UploadTask uploadTask = ref.putFile(file);

        var imageUrl = await (await uploadTask).ref.getDownloadURL();
        setState(() {
          url = imageUrl.toString();
        });
      } else {
        print('No Image Path Received');
      }
    } else {
      print('Permission not granted. Try Again with permission access');
    }
  }
  // Future getImage(ImageSource source,context) async {
  //   await ImagePicker().pickImage(source: source).then((xFile) {
  //     if (xFile != null) {
  //       setState(() {
  //         imageFile = File(xFile.path);
  //       });
  //       uploadImage();
  //     }
  //     Navigator.of(context).pop();
  //
  //   });
  // }
  //
  // Future uploadImage() async {
  //   Reference firebaseStorageRef =
  //   FirebaseStorage.instance.ref().child("UserImages");
  //   final UploadTask task = firebaseStorageRef.putFile(imageFile!);
  //
  //   task.whenComplete(() async {
  //     try {
  //       downloadURL = await firebaseStorageRef.getDownloadURL();
  //       print("this is url $downloadURL");
  //     } catch (onError) {
  //       print("Error");
  //     }
  //
  //   });
  // }

  final _formkey = GlobalKey<FormState>();
  var email = '';
  var name = '';
  var phone = '';
  String image = '';

  Future updateUser(
      name,
      email,
      phone,
      image,
      ) async {
    await FirebaseFirestore.instance
        .collection("registration")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({
      'name': name,
      'email': email,
      'phone': phone,
      'Image': url,

    });
  }

  @override
  void dispose() {
    super.dispose();

  }

  Widget build(BuildContext context) {
    // ignore: dead_code
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Profile",
          style: GoogleFonts.roboto(
            fontSize: 25.0,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          child: FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('registration')
                .doc(FirebaseAuth.instance.currentUser?.uid)
                .get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                print('somthing went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              var data = snapshot.data;
              email = data!['email'];
              name = data['name'];
              phone = data['phone'];
              image = data['Image'];
              return Form(
                key: _formkey,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Stack(
                          fit: StackFit.loose,
                          children: <Widget>[
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                url != null
                                    ? CircleAvatar(
                                  radius: 80.0,
                                  backgroundImage: NetworkImage(url!),
                                )
                                    : image != ''
                                    ? CircleAvatar(
                                  radius: 80.0,
                                  backgroundImage: NetworkImage(image),
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
                              padding: EdgeInsets.only(top: 120.0, left: 90.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: ((builder) =>
                                            bottomSheet(context)),
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
                              initialValue: name,
                              autofocus: false,
                              onChanged: (value) => name = value,
                              decoration: const InputDecoration(
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
                              initialValue: email,
                              autofocus: false,
                              onChanged: (value) => email = value,
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
                              initialValue: phone,
                              autofocus: false,
                              onChanged: (value) => phone = value,
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
                            height: 120,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 40.0,
                              width: 280.0,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                color: Color.fromARGB(255, 218, 162, 16),
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    updateUser(name, email, phone, image);
                                  }
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => updatesplash()));

                                      (route) => false;
                                },
                                child: Text(
                                  'Update',
                                  style: GoogleFonts.roboto(
                                    fontSize: 17.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),

                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget bottomSheet(context) {
    return Container(
      height: 80.0,
      width: MediaQuery.of(context).size.width,
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
                color: Color.fromARGB(255, 218, 162, 16),
                size: 30.0,
              ),
              onPressed: () {
                addImage();
                Navigator.pop(context);
              },
              label: Text("Camera"),
            ),
            SizedBox(
              width: 40.0,
            ),
            FlatButton.icon(
              icon: Icon(
                Icons.image,
                color: Color.fromARGB(255, 218, 162, 16),
                size: 30.0,
              ),
              onPressed: () {
                uploadImage();
                Navigator.pop(context);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }
}