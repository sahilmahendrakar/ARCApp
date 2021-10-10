//This is temporary, just for testing firebase authentication
import 'package:arc_app/constants.dart';
import 'package:arc_app/screens/Dashboard/dashboard_screen.dart';
import 'package:arc_app/screens/Summary/summary_screen.dart';
import 'package:arc_app/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 1;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onTabTapped(index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ARC",
          style: TextStyle(fontSize: 20.0),
        ),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SettingsScreen.routeName);
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: [Placeholder(Colors.blue), Dashboard(), SummaryScreen()],
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: pureWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
            boxShadow: [
            BoxShadow(color: pureBlack, spreadRadius: 0, blurRadius: 10),]),
        child: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _selectedIndex,
          selectedItemColor: darkestBlue,
          elevation: 50.0,
          items: [
            new BottomNavigationBarItem(
              icon: Icon(Icons.timeline),
              label: 'Timeline',
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.history), //Summary
              label: 'Summary',
            ),
            new BottomNavigationBarItem(
                icon: Icon(Icons.assignment), label: 'Survey'),
            new BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          onPressed: () {
            Navigator.pushNamed(context, Dashboard.routeName);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class Placeholder extends StatelessWidget {
  final Color color;

  Placeholder(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
