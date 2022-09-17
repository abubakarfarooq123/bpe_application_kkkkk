import 'package:bpe_application/chat/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Conversation extends StatefulWidget {
  const Conversation({Key? key}) : super(key: key);

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
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
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(75, 0, 0, 0),
            child: Text(
              "Chats",
              style: GoogleFonts.roboto(color: Colors.white),
            ),
          ),
        ),
        body: ClipRRect(
        borderRadius: new BorderRadius.only(
        topLeft: const Radius.circular(40.0),
    topRight: const Radius.circular(40.0),
    ),
    child: Container(
      color: Colors.white,
      height: 800,


    ),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return SearchPage();
          }));
        },
        child: Icon(Icons.search),

      ),
    );
  }
}
