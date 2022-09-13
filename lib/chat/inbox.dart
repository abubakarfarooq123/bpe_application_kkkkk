import 'package:bpe_application/chat/chat.dart';
import 'package:bpe_application/provider/chatprovider.dart';
import 'package:bpe_application/provider/userdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageInboxPage extends StatefulWidget {
  @override
  _MessageInboxPageState createState() => _MessageInboxPageState();
}

class _MessageInboxPageState extends State<MessageInboxPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color.fromARGB(2000, 34, 116, 135),
        elevation: 8.0,
        title: Text(
          "Inbox",
        ),
      ),
    );
  }
}

class MessageFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select label"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "FILTERS",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, top: 15.0, bottom: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "All",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, top: 15.0, bottom: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Unread",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, top: 15.0, bottom: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Starred",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, top: 15.0, bottom: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Archived",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, top: 15.0, bottom: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Spam",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, top: 15.0, bottom: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Sent",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, top: 15.0, bottom: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Custom Offers",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 15.0, bottom: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "LABELS",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, top: 15.0, bottom: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Follow-up",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, top: 15.0, bottom: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Nudge",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}