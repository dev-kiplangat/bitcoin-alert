import 'package:crypto_tracker/screens/alert.dart';
import 'package:crypto_tracker/screens/chart.dart';
import 'package:crypto_tracker/screens/profile.dart';
import 'package:flutter/material.dart';

import 'package:crypto_tracker/constants.dart';
import 'package:crypto_tracker/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'crypto alert',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.teal,
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme:
              Theme.of(context).textTheme.apply(displayColor: kTextColor)),
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
      bottomNavigationBar: Container(
        height: 75,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 33,
              offset: Offset(0, -7),
              color: Color(0xFF6DAED9).withOpacity(.11),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.dashboard_outlined),
              color: kTextMediumColor,
              iconSize: 32,
            ),
            IconButton(
              tooltip: "charts",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ChartPage();
                    },
                  ),
                );
              },
              icon: Icon(Icons.bar_chart),
              color: Colors.red.withOpacity(.6),
              iconSize: 32,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AlertPage();
                    },
                  ),
                );
              },
              icon: Icon(Icons.notifications_active),
              color: kTextMediumColor,
              iconSize: 32,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfilePage();
                    },
                  ),
                );
              },
              icon: Icon(Icons.person_outline_outlined),
              color: kTextMediumColor,
              iconSize: 32,
            ),
          ],
        ),
      ),
    );
  }
}
