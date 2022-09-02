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

class Edit_Profile extends StatefulWidget {
  const Edit_Profile({Key? key}) : super(key: key);

  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  // File? imageFile;
  // String? downloadURL;
  // // Future getImage(ImageSource source,context) async {
  // //   await ImagePicker().pickImage(source: source).then((xFile) {
  // //     if (xFile != null) {
  // //       setState(() {
  // //         imageFile = File(xFile.path);
  // //       });
  // //       _uploadImage(context);
  // //     }
  // //     Navigator.of(context).pop();
  // //   });
  // // }
  // //
  // // // Future uploadImage() async {
  // // //   Reference firebaseStorageRef =
  // // //   FirebaseStorage.instance.ref().child("$imageFile");
  // // //   final UploadTask task = firebaseStorageRef.putFile(imageFile!);
  // // //
  // // //   task.whenComplete(() async {
  // // //     try {
  // // //       downloadURL = await firebaseStorageRef.getDownloadURL();
  // // //       print("this is url $downloadURL");
  // // //     } catch (onError) {
  // // //       print("Error");
  // // //     }
  // // //   });
  // // // }
  // //
  // //
  // //
  // //
  // // // var imageFile;
  // // // var downloadURL;
  // // // Future getImage(ImageSource source, context) async {
  // // //   final XFile? pickedImage = await ImagePicker().pickImage(source: source);
  // // //     if (pickedImage != null) {
  // // //       setState(() {
  // // //         imageFile = pickedImage.path;
  // // //       });
  // // //       uploadImage();
  // // //     }
  // // //     Navigator.of(context).pop();
  // // //
  // // // }
  // // //
  // // // // Future pickImage() async{
  // // // //   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  // // // //   if(image == null) return;
  // // // //   final imageTemp = (File(image.path));
  // // // // }
  // // //
  // // // Future uploadImage() async {
  // // //   Reference firebaseStorageRef =
  // // //   FirebaseStorage.instance.ref().child("UserImages");
  // // //   final UploadTask task = firebaseStorageRef.putFile(imageFile);
  // // //
  // // //   task.whenComplete(() async {
  // // //     try {
  // // //       downloadURL = await firebaseStorageRef.getDownloadURL();
  // // //       print("this is url $downloadURL");
  // // //     } catch (onError) {
  // // //       print("Error");
  // // //     }
  // // //   });
  // // // }
  // //
  // // // TODO Upload Image To Firebase Database
  // // Future _uploadImage(context) async {
  // //   final file = File(imageFile!.path);
  // //   final destination = "Mobile_Images/${DateTime.now()}.png";
  // //   if (imageFile != null) {
  // //     Reference reference =
  // //     FirebaseStorage.instance.ref("Images").child(destination);
  // //     UploadTask _uploadTask = reference.putFile(file);
  // //     _uploadTask.whenComplete(() async {
  // //       try {
  // //         String uploadedImageUrl = await reference.getDownloadURL();
  // //         downloadURL = uploadedImageUrl;
  // //         print("This is URL: $uploadedImageUrl");
  // //       } catch (e) {
  // //         print(e.toString());
  // //       }
  // //     });
  // //   } else {
  // //     Navigator.of(context).pop();
  // //   }
  // // }
  //
  // // TODO Pick Image From Gallery
  // // String imageUrl = "";
  //
  // void pickImage() async {
  //   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   Reference ref = FirebaseStorage.instance.ref().child("profileImages.jpg");
  //   await ref.putFile(File(image!.path));
  //   ref.getDownloadURL().then((value) {
  //     print(value);
  //     setState(() {
  //       imageFile = value as File?;
  //     });
  //   });
  // }
  //
  // // /// Active image file
  // // File? _imageFile;
  // // String? imageSnap;
  // //
  // // /// Update an image via gallery
  // // Future _pickImage(ImageSource source) async {
  // //   final XFile? selected = await ImagePicker().pickImage(source: source);
  // //   final File myImageFile = File(selected!.path);
  // //   setState(() {
  // //     _imageFile = myImageFile;
  // //   });
  // //
  // //   _uploadImage(context);
  // // }
  // //
  // // /// Update to Firebase
  // // Future _uploadImage(context) async {
  // //   final file = File(_imageFile!.path);
  // //   final destination = "Mobile_Images/${DateTime.now()}.png";
  // //   if (_imageFile != null) {
  // //     Reference reference =
  // //         FirebaseStorage.instance.ref(email).child(destination);
  // //     UploadTask _uploadTask = reference.putFile(file);
  // //     _uploadTask.whenComplete(() async {
  // //       try {
  // //         String uploadedImageUrl = await reference.getDownloadURL();
  // //         imageSnap = uploadedImageUrl;
  // //         print("This is URL: http://$imageSnap");
  // //       } catch (e) {
  // //         print(e);
  // //       }
  // //     });
  // //   } else {
  // //     ScaffoldMessenger.of(context).showSnackBar(
  // //         SnackBar(content: Text("Grant Permission and try again !")));
  // //     Navigator.of(context).pop();
  // //   }
  // // }

  // TODO Upload Image
  /// Active image file
  File? _imageFile;
  String? imageSnap;

  /// Select an image via gallery
  Future pickImage(ImageSource source) async {
    XFile? selected = (await ImagePicker().pickImage(source: source)) as XFile;
    // setState(() {
    //   _imageFile = selected;
    // });
    /// Upload Image to Firebase
    final file = File(selected.path);
    final destination = "${email}/${DateTime.now()}.png";
    Reference reference =
    FirebaseStorage.instance.ref("Profile_Images").child(destination);
    UploadTask _uploadTask = reference.putFile(file);
    _uploadTask.whenComplete(() async {
      try {
        String uploadedImageUrl = await reference.getDownloadURL();
        imageSnap = uploadedImageUrl;
        // showToaster("Image uploaded successfully");
        print("This is URL: $imageSnap");
      } catch (e) {
        print(e.toString());
      }
    });
  }

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
      'Image': imageSnap
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
          style: GoogleFonts.limelight(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                imageSnap == null
                                    ? CircularProgressIndicator()
                                    : CircleAvatar(
                                        radius: 80.0,
                                        child: ClipOval(
                                            child: Image.network(imageSnap.toString())),
                                      )
                              ],
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.0),
                                    child: new Stack(
                                      fit: StackFit.loose,
                                      children: <Widget>[
                                        new Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            imageSnap != null
                                                ? CircleAvatar(
                                              radius: 80.0,
                                              backgroundImage: NetworkImage(imageSnap.toString()),
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
                                      ],
                                    ),
                                  ),
                                ]
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
                pickImage(ImageSource.camera);
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
                pickImage(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }
}
