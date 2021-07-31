import 'package:crypto_tracker/components/theme.dart';
import 'package:crypto_tracker/config/alerts.dart';
import 'package:crypto_tracker/config/market.dart';
import 'package:crypto_tracker/config/user.dart';
import 'package:crypto_tracker/screens/home.dart';
import 'package:crypto_tracker/screens/splash_screen.dart';
import 'package:crypto_tracker/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserModel()),
        ChangeNotifierProvider(create: (context) => AlertsModel()),
        ChangeNotifierProvider(create: (context) => Market()),
      ],
      child: MyApp(),
    ),
  );
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
      initialRoute: "/",
      themeMode: ThemeMode.system,
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
