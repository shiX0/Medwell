import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:medwell/Components/Pallete.dart';
import 'package:medwell/Screens/LandingPage.dart';
import 'package:medwell/Screens/LoginScreen.dart';
import 'package:medwell/Screens/finalLog.dart';

class NavPages extends StatefulWidget {
  const NavPages({Key? key}) : super(key: key);

  @override
  State<NavPages> createState() => _NavPagesState();
}

class _NavPagesState extends State<NavPages> {
  // List of pages to be displayed in the Bottom Nav Bar
  List pages = [
    LandingPage(), // Index 0
    const LoginScreen(), // Index 1
    null, // Placeholder for nav item 3, will be handled separately
    LandingPage(), // Index 3
    const finalLog(), // Index 4
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        // Set the background color of the Nav bar to Linear transparent Gradient
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFFFFFFF).withOpacity(0.0), // Transparent white
              const Color(0xFFFFFFFF).withOpacity(0.29), // Opaque white
              const Color(0xFFFFFFFF).withOpacity(1.0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: BottomNavigationBar(
          elevation: 10,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Pallete.primary,
          unselectedItemColor: Colors.black26,
          type: BottomNavigationBarType.fixed,
          items: [
            //Bottom Nav Items, icons and styles
            const BottomNavigationBarItem(
              label: "Home",
              icon: Icon(FluentSystemIcons.ic_fluent_apps_add_in_filled),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_apps_add_in_filled),
            ),
            BottomNavigationBarItem(
              label: "Calendar",
              icon: Image.asset(
                'assets/images/calendarLogo.png',
                width: 24,
                height: 24,
              ),
              activeIcon: Image.asset(
                'assets/images/calendarLogo.png',
                width: 24,
                height: 24,
                color: Pallete.primary,
              ),
            ),
            BottomNavigationBarItem(
              label: "Add Plan",
              icon: Image.asset(
                'assets/images/AddMeds.png',
                width: 60,
                height: 60,
              ),
            ),
            BottomNavigationBarItem(
              label: "Cycle",
              icon: Image.asset(
                'assets/images/4th.png',
                width: 24,
                height: 24,
              ),
              activeIcon: Image.asset(
                'assets/images/4th.png',
                width: 24,
                height: 24,
                color: Pallete.primary,
              ),
            ),
            const BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person_2_rounded),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
              // Handle navigation for nav item 3 (index 2)
              if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const finalLog()),
                );
              } else {
                setState(() {
                  _selectedIndex = index;
                });
              }
            });
          },
        ),
      ),
      body: pages[_selectedIndex],
    );
  }
}
