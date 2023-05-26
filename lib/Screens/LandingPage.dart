import 'package:flutter/material.dart';
import 'package:medwell/Screens/loginScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 4) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.velocity.pixelsPerSecond.dx > 0) {
            // Swiped Right
            if (_currentPage > 0) {
              _pageController.previousPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            }
          } else if (details.velocity.pixelsPerSecond.dx < 0) {
            // Swiped Left
            if (_currentPage < 4) {
              _pageController.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            }
          }
        },
        child: PageView(
          controller: _pageController,
          onPageChanged: (int page) {
            setState(() {
              _currentPage = page;
            });
          },
          children: [
            LandingPageItem(
              logo: Image.asset('assets/images/Logo.png'),
              picture: Image.asset('assets/images/pic.png'),
              background:Image.asset('assets/images/blob.png'),
              greeting: 'WELCOME!',
              text: 'Stay on top of your health journey with our easy-to-use tracker app.',
            ),
            loginScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0), // Add the desired padding
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 2; i++)
              if (_currentPage == i)
                NavigationDot(isActive: true)
              else
                NavigationDot(isActive: false)
          ],
        ),
      ),
    );
  }
}

class LandingPageItem extends StatelessWidget {
  final Widget logo;
  final Widget picture;
  final Widget background;
  final String greeting;
  final String text;

  LandingPageItem({
    required this.logo,
    required this.picture,
    required this.background,
    required this.greeting,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: logo,
        ),
        SizedBox(height: 20),
        Stack(
          alignment: Alignment.center,
          children: [
            Padding(padding: const EdgeInsets.only(left: 111),
            child: background,
          ),
            Positioned.fill(
              child: picture,
            ),
          ],
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              greeting,
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}


class NavigationDot extends StatelessWidget {
  final bool isActive;

  NavigationDot({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: isActive ? 20 : 10,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isActive ? 5 : 10),
        color: isActive ? Colors.cyanAccent : Color(0xFF7172A7),
      ),
    );
  }
}
