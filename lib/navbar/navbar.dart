import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationBarController extends StatefulWidget {
  NavigationBarController(BuildContext context);


  @override
  _NavigationBarControllerState createState() =>
      _NavigationBarControllerState();
}

class _NavigationBarControllerState
    extends State<NavigationBarController> {
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
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index){
            setState(() {
              _currentIndex = index;
            });

          },

        ),
      ),
      bottomNavigationBar: BottomNavyBar(
      onItemSelected: (index){
        setState(() {
          _pageController.jumpToPage(index);
        });
      },
      items: <BottomNavyBarItem>[
           BottomNavyBarItem(
               icon: Icon(Icons.home,color: Colors.grey),
               title: Text("Home",style:GoogleFonts.raleway(color: Colors.grey)),
           ),
           BottomNavyBarItem(
             icon: Icon(Icons.wallet,color: Colors.grey),
             title: Text("Wallet",style:GoogleFonts.raleway(color: Colors.grey)),
           ),
           BottomNavyBarItem(
             icon: Icon(Icons.message_outlined,color: Colors.grey),
             title: Text("Message",style:GoogleFonts.raleway(color: Colors.grey)),
           ),
           BottomNavyBarItem(
             icon: Icon(Icons.account_circle,color: Colors.grey),
             title: Text("Profile",style:GoogleFonts.raleway(color: Colors.grey)),
           ),
         ],
       ),

    );
  }
}