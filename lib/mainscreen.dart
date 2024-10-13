import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottomnavbar.dart';
import 'package:flutter_application_1/feature/homescreen/presentation/pages/homescreen.dart';
import 'package:flutter_application_1/feature/release_calendar/presentation/pages/release_calendar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    ReleaseCalendar(),
    ReleaseCalendar(),
    ReleaseCalendar(),
    ReleaseCalendar(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(selectedIndex), //New
      ),
      bottomNavigationBar: MyBottomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
