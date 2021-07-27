import 'package:crypto_tracker/constants.dart';
import 'package:crypto_tracker/screens/alert.dart';
import 'package:crypto_tracker/screens/chart.dart';
import 'package:crypto_tracker/screens/home.dart';
import 'package:crypto_tracker/screens/profile.dart';
import 'package:flutter/material.dart';

class PageRenderer extends StatefulWidget {
  const PageRenderer({Key? key}) : super(key: key);

  @override
  State<PageRenderer> createState() => _PageRenderer();
}

/// This is the private State class that goes with MyStatefulWidget.
class _PageRenderer extends State<PageRenderer> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ChartPage(),
    AlertPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'Dashboard',
            icon: Icon(
              Icons.dashboard_outlined,
              color: kTextMediumColor,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Charts',
            icon: Icon(
              Icons.bar_chart,
              color: kTextMediumColor,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Alerts',
            icon: Icon(
              Icons.notifications_active,
              color: kTextMediumColor,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(
              Icons.person_outline_outlined,
              color: kTextMediumColor,
              size: 32,
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
