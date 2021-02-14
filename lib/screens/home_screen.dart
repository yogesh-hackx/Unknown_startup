import 'package:application_unknown/call_screens/pickup_layout.dart';
import 'package:application_unknown/firebase/FirebaseMethods.dart';
import 'package:application_unknown/screens/profile_screen.dart';
import 'package:application_unknown/screens/settings_screen.dart';
import 'package:application_unknown/screens/status_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import './users_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //PageController Initialization
  PageController pageController;
  //Bottom Navigation bar(onTap)
  int currentIndex = 0;
  //Bottom Navigation bar(onTap)

  onLoad() async {
    Map<String, dynamic> onlineIndicator = {"isOnline": true};
    await FirebaseMethods().updateOnlineIndicator(onlineIndicator);
  }

  @override
  void initState() {
    super.initState();
    onLoad();
    pageController = PageController();
  }

  onEnd() {
    Map<String, dynamic> onlineIndicator = {"isOnline": false};
    FirebaseMethods().updateOnlineIndicator(onlineIndicator);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  //
  void onPageChanged(int currentIndex) {
    setState(() {
      this.currentIndex = currentIndex;
    });
  }

//Bottom Navigation bar(onTap)
  void navigation(int currentIndex) {
    pageController.jumpToPage(currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return PickUpLayout(
      userUid: FirebaseMethods().auth.currentUser.uid,
      scaffold: Scaffold(
        body: PageView(
          children: [
            ChatScreenUsers(),
            StatusScreen(),
            ProfileScreen(),
            SettingsScreen(),
          ],
          controller: pageController,
          onPageChanged: onPageChanged,
        ),
        bottomNavigationBar: SizedBox(
          height: 85,
          child: BottomNavigationBar(
            iconSize: 25.0,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.mark_chat_unread),
                label: "Chats",
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_filled_rounded),
                label: "Status",
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded),
                label: "Profile",
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.settings_rounded),
                label: "Settings",
              ),
            ],
            currentIndex: currentIndex,
            onTap: navigation,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey[700],
            selectedLabelStyle: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
