import 'package:bpe_application/chat/chatroom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Conversation extends StatefulWidget {
  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> with WidgetsBindingObserver {
  late final String chatRoomId;


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    setStatus("Online");
  }

  void setStatus(String status) async{
    await _firestore.collection('registration').doc(_auth.currentUser!.uid).update({
      "status": status,
    });


  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    if (state == AppLifecycleState.resumed){
      //online
      setStatus("Online");
    }else{
      //offline
      setStatus("Offline");
    }

  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Map<String, dynamic>? userMap;
  bool isLoading= false;
  final TextEditingController _search = TextEditingController();
  ScrollController scrollController = ScrollController();

  String chatroomId(String user1, String user2){
   if(user1[0].toLowerCase().codeUnits[0] > user2.toLowerCase().codeUnits[0]){
     return "$user1$user2";
   }else{
     return "$user2$user1";
   }
  }
  // void _fetch() async {
  //   // Wait for all documents to arrive, first.
  //   final result = await _firestore
  //       .collection('users')
  //       .doc();
  //
  //   List<User> users = [];
  //
  //   result.collection("registration").forEach((doc) {
  //
  //     String id = doc.data['uid'];
  //     if (id.hashCode <= _auth.currentUser.hashCode) {
  //       chatRoomId = '$id-$_auth.currentUser';
  //     } else {
  //       chatRoomId = '$_auth.currentUser-$id';
  //     }
  //
  //     users.userMap((['$user1[0]']) = doc.data['id'];
  //     userMap.displayName = doc.data['name'];
  //
  //     // Wait for each single message to arrive
  //     final m = await Firestore.instance
  //         .collection('messages')
  //         .document(chatRoomId)
  //         .collection(chatRoomId)
  //         .getDocuments();
  //
  //     if (m.documents.length > 0) {
  //       users._message = m.documents.first.data['message'];
  //     }
  //
  //     print(users.LastMessage);
  //
  //     users.add(users);
  //   });
  //
  //   setState(() {
  //     user1[0] = users;
  //   });
  // }

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    setState(() {
      isLoading = true;
    });
    await _firestore.collection("registration").
    where("email", isEqualTo: _search.text).
    get().then((value) {
       setState(() {
        userMap= value.docs[0].data();
        isLoading=false;
      });
      print(userMap);

    }
    );

  }
  void listView() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    setState(() {
      isLoading = true;
    });
    await _firestore.collection("registration").
    where("email", isEqualTo: _search.text).
    get().then((value) {
      setState(() {
        userMap= value.docs[0].data();
        isLoading=false;
      });
      print(userMap);

    }
    );

  }
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //top bar color
      systemNavigationBarColor: Colors.black, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
          child: Text(
            "Chat",
            style: GoogleFonts.limelight(color: Colors.white),
          ),
        ),
      ),
      body: isLoading? Center(
        child: Container(
        height: size.height/20,
          width: size.width/20,
          child: CircularProgressIndicator(),
      ),
      )
          : ClipRRect(
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(40.0),
          topRight: const Radius.circular(40.0),
        ),
        child: Container(
          height: 800.0,
          width: double.infinity,
          color: Colors.grey.shade200,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: size.height/14,
                width: size.width,
                alignment: Alignment.center,
                child: Container(
                  height: size.height/14,
                  width: size.width/1.2,
                  child: TextField(
                    controller: _search,
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height/70,
              ),
              ElevatedButton(
                  onPressed: onSearch,
                  child: Text(
                    "Search",style: GoogleFonts.roboto(
                    color: Colors.white,
                  ),
              ),
              ),
              SizedBox(
                height: size.height/60,
              ),
              userMap != null
                  ? ListTile(
                onTap: () {
                  String roomId = chatroomId(
                      _auth.currentUser!.displayName!,
                      userMap!['name']);

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => chatroom(
                        chatRoomId: roomId,
                        userMap: userMap!,
                      ),
                    ),
                  );
                },

                leading: Icon(
                  Icons.account_box,
                  color: Colors.black,
                ),
                title: Text(
                  userMap!['name'],
                  style: GoogleFonts.roboto(
                  color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(userMap!['email']),
                trailing: Icon(
                  Icons.chat,
                  color: Colors.black,
                ),
              )
                  : Container(),

            ],
            ),
          ),
        ),
      ),
    );
  }

}
