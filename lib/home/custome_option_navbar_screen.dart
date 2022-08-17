import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:bpe_application/chat/chat.dart';
import 'package:bpe_application/home/home.dart';
import 'package:bpe_application/trip/trip.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../user/profile.dart';
import 'custom_option.dart';

class CustomOptionNavBar extends StatefulWidget {
  const CustomOptionNavBar({Key? key}) : super(key: key);

  @override
  _CustomOptionNavBarState createState() => _CustomOptionNavBarState();
}

class _CustomOptionNavBarState extends State<CustomOptionNavBar> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          const Custom_Option(),
          const Trip(),
          const Chat(),
          const Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        containerHeight: 55.0,
        backgroundColor: Colors.white70,
        selectedIndex: _currentIndex,
        showElevation: false,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeIn);
        }),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            inactiveColor: Colors.black,
            icon: const Icon(Icons.home),
            title: const Text('Home'),
            activeColor: Color.fromARGB(255, 218, 162, 16),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.black,
            icon: const Icon(Icons.local_airport),
            title: const Text('Trip'),
            activeColor: Color.fromARGB(255, 218, 162, 16),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.black,
            icon: const Icon(Icons.message),
            title: const Text(
              'Inbox',
            ),
            activeColor: Color.fromARGB(255, 218, 162, 16),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.black,
            icon: const Icon(FontAwesomeIcons.user,
            size: 20,),
            title: const Text('Profile'),
            activeColor: Color.fromARGB(255, 218, 162, 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
