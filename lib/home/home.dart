import 'package:bpe_application/dum.dart';
import 'package:bpe_application/home/dumy.dart';
import 'package:bpe_application/home/flight.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool enabled = true;

  load() async{
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      enabled = false;
    });
  }
  void initState() {
    super.initState();
    load();
  }
  Widget list() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("flights").snapshots(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot dc = snapshot.data!.docs[index];
                  return SingleChildScrollView(
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Flight(
                                          dc: dc,
                                        )));
                          },
                          child: Container(
                            height: 100,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          "From",
                                          style: GoogleFonts.roboto(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_circle_right,
                                        size: 35,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 9),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        dc['from'],
                                        style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 13),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        dc['city1'],
                                        style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 20,
                                width: 10,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      return Flex(
                                        children: List.generate(
                                            (constraints.constrainWidth() / 10)
                                                .floor(),
                                            (index) => SizedBox(
                                                  height: 1,
                                                  width: 5,
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade300),
                                                  ),
                                                )),
                                        direction: Axis.horizontal,
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              FlatButton(
                                onPressed: () {},
                                child: Icon(Icons.watch_later_outlined),
                              ),
                              SizedBox(
                                height: 20,
                                width: 10,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 110,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 12, 0, 8),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        "To",
                                        style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 13),
                                Row(
                                  children: [
                                    Text(
                                      dc['to'],
                                      style: GoogleFonts.roboto(
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 11),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        dc['city2'],
                                        style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

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
            "Flights",
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
          height: 800.0,
          width: double.infinity,
          color: Colors.grey.shade200,
          child: Column(
    mainAxisSize: MainAxisSize.max,
    children: [
    Expanded(
    child: ListView.builder(
    itemBuilder: (context, index) {
      if (enabled) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: ListTile(
            title: Container(
              color: Colors.white,
              height: 10, width: 100,
            ),
            subtitle: Container(
              color: Colors.white,
              height: 10, width: 100,
            ),
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
            ),
          ),
        );
      } else {
        return list();
      }
    }
    ),
    ),
    ]
        ),
      ),
    ),
    );
  }
}
