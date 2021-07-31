import 'package:crypto_tracker/components/navigator.dart';
import 'package:crypto_tracker/components/theme.dart';
import 'package:crypto_tracker/screens/home.dart';
import 'package:crypto_tracker/screens/splash_screen.dart';
import 'package:crypto_tracker/screens/welcome.dart';
import 'package:flutter/material.dart';

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
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      // home: PageRenderer(),
      initialRoute: "/home",
      routes: {
        '/': (context) => SplashScreen(duration: 5),
        '/welcome': (context) => IntroScreen(),
        '/home': (context) => HomeScreen(),

        // '/welcome': (context) =>  WelcomePage(),
        // '/home': (context) => HomePage(),
        // '/profile': (context) => ProfilePage(),
        // '/details': (context) => detailsPage(),
        // '/alerts': (context) => detailsPage(),
      },
    );
  }
}
