import 'package:bpe_application/payment/add_manually.dart';
import 'package:bpe_application/payment/payment_method.dart';
import 'package:bpe_application/navbar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int _currentIndex = 0;
  late PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
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
          child: Text("Payment",
          style: GoogleFonts.roboto(
            fontSize: 25,
          ),),
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
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(13, 15, 0, 0),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 265, 10),
                      child: Text(
                        "Itinerary",
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 25, 0, 0),
                          child: Text(
                            "14 September 2022",
                            textAlign: TextAlign.end,
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(95, 25, 0, 0),
                          child: Text(
                            "14 September 2022",
                            textAlign: TextAlign.end,
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                          child: Text(
                            "12:00 PM",
                            textAlign: TextAlign.end,
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(85, 15, 0, 0),
                          child: Text(
                            "EFT 0h 21m",
                            textAlign: TextAlign.end,
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(55, 15, 0, 0),
                          child: Text(
                            "12:21 PM",
                            textAlign: TextAlign.end,
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(18, 25, 0, 0),
                          child: Text(
                            "Mexico Punta Mita",
                            textAlign: TextAlign.end,
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(120, 25, 0, 0),
                          child: Text(
                            "Atlanta Georgia",
                            textAlign: TextAlign.end,
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 30, 150, 0),
                    child: Text(
                      "Choose Payment Type",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
                        child: Text(
                          "Credit Card",
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                          ),
                        ),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                          child: IconButton(
                            icon: Icon(Icons.radio_button_checked,
                              size: 30,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Manually()));
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text("<-- Click Here",
                        style: GoogleFonts.roboto(
                          color: Colors.black45
                        ),
                        )
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 20, 130, 0),
                          child: Text("Apply Credits and Balances",
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 13
                            ),
                          ),
                        ),
                    SizedBox(
                      height: 180,
                    ),
                    Container(
                      height: 40,
                      width: 320,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Color.fromARGB(255, 218, 162, 16),
                        onPressed: () { Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Payment_Method())); },
                        child: Center(
                          child: Text(
                            "Book",
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
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
