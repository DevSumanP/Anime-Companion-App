import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class MyBottomNavBar extends StatelessWidget {
  final dynamic Function(int)? onItemTapped;
  final int selectedIndex;
  const MyBottomNavBar({
    super.key,
    required this.onItemTapped,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      currentIndex: selectedIndex,
      unselectedItemColor: const Color.fromARGB(255, 143, 143, 143),
      selectedItemColor: const Color.fromARGB(255, 1, 165, 23),
      onTap: onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(IconlyLight.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(IconlyLight.calendar), label: 'Calendar'),
        BottomNavigationBarItem(
            icon: Icon(IconlyLight.bookmark), label: 'My List'),
        BottomNavigationBarItem(
          icon: Icon(
            IconlyLight.download,
          ),
          label: 'Download',
        ),
        BottomNavigationBarItem(icon: Icon(IconlyLight.user), label: 'Profile'),
      ],
    );
  }
}
