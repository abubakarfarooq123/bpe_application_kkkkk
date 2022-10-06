import 'package:bpe_application/payment/instalment_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Manually extends StatefulWidget {
  const Manually({Key? key}) : super(key: key);

  @override
  State<Manually> createState() => _ManuallyState();
}

class _ManuallyState extends State<Manually> {
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
            "Enter Manually",
            style: GoogleFonts.roboto(
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
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                    "Card Details",
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: new Form(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Number',
                              icon: Icon(
                                FontAwesomeIcons.creditCard,
                                color: Color.fromARGB(255, 218, 162, 16),
                              ),
                            ),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Card Holder Name',
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
                    decoration: InputDecoration(
                      hintText: 'Expiry Date',
                      icon: Icon(
                        FontAwesomeIcons.calendar,
                        color: Color.fromARGB(255, 218, 162, 16),
                      ),
                    ),
                  ),
                ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'CVV',
                              icon: Icon(
                                FontAwesomeIcons.solidCreditCard,
                                color: Color.fromARGB(255, 218, 162, 16),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 200,
                        ),
                        Center(
                          child: Container(
                            height: 40.0,
                            width: 340.0,
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Installment_Plan()));

                              },
                              color: Color.fromARGB(1000, 218, 162, 16),
                              child: Text(
                                'Submit',
                                style: GoogleFonts.roboto(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),


                      ],
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
