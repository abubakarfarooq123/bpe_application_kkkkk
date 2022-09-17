import 'package:bpe_application/home/pessanger_navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  DateTime dateupdate(dateend) {
    var newDate = new DateTime(dateend.year, dateend.month, dateend.day + 4);
    return newDate;
  }

  static final DateTime month = DateTime.now();

  var date = '';

  Future updateUser(selectedDT, selectEnd) async {
    DateTime selectedDT = selectedDay;
    DateTime selectEnd = dateupdate(selectedDay);
    await FirebaseFirestore.instance
        .collection("Book")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({
      'date': selectedDT,
      'enddate': selectEnd,
    });
  }
  String formatted(timestamp) {
    var dateFromTimeStamp =
    DateTime.fromMillisecondsSinceEpoch(timestamp.seconds * 1000);
    return DateFormat('dd-MM-yyyy').format(dateFromTimeStamp);
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
          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
          child: Text(
            "Pick a Date",
            style:
                GoogleFonts.roboto(fontSize: 25, fontWeight: FontWeight.bold),
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 220, 20),
                  child: Text(
                    "${DateFormat('MMMM').format(DateTime.now())}",
                    style: GoogleFonts.roboto(
                        color: Colors.blue.shade900,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 30, 5),
                            child: Text(
                              "Depart",
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 8, 5, 0),
                            child: Text(
                              "${DateFormat('yMd').format(selectedDay)}",
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(170, 10, 0, 5),
                            child: Text(
                              "Return",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(145, 10, 0, 5),
                            child: Text(
                              "${DateFormat('yMd').format(dateupdate(selectedDay))}",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: TableCalendar(
                    focusedDay: selectedDay,
                    firstDay: DateTime(2021),
                    lastDay: DateTime(2050),
                    calendarFormat: format,
                    onFormatChanged: (CalendarFormat _format) {
                      setState(() {
                        format = _format;
                      });
                    },
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    daysOfWeekVisible: true,
                    onDaySelected: (DateTime selectDay, DateTime focusDay) {
                      setState(() {
                        selectedDay = selectDay;
                        focusedDay = focusDay;
                      });
                    },
                    calendarStyle: CalendarStyle(
                        isTodayHighlighted: true,
                        selectedDecoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        selectedTextStyle: TextStyle(color: Colors.white),
                        todayDecoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: true,
                      formatButtonShowsNext: false,
                    ),
                    selectedDayPredicate: (DateTime date) {
                      return isSameDay(selectedDay, date);
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
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
                      setState(() {
                        updateUser(selectedDay, dateupdate(selectedDay));
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PessengerNavBar()));
                    },
                    child: Text(
                      'Done',
                      style: GoogleFonts.roboto(
                        fontSize: 18.0,
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
