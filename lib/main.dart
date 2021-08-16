import 'package:Rook/components/navigator.dart';
import 'package:Rook/components/theme.dart';
import 'package:Rook/config/alerts.dart';
import 'package:Rook/config/market.dart';
import 'package:Rook/config/user.dart';
import 'package:Rook/screens/alert/create_alert.dart';
import 'package:Rook/screens/login/login.dart';
import 'package:Rook/screens/otp_verify/otp_verify.dart';
import 'package:Rook/screens/splash_screen/splash_screen.dart';
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
      title: 'Rook',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      initialRoute: "/",
      themeMode: ThemeMode.system,
      routes: {
        '/': (context) => SplashScreen(duration: 2),
        '/home': (context) => PageRenderer(),

        '/login': (context) => LoginScreen(),
        "/otp_verify": (context) => OtpScreen(),
        "/create_alert": (context) => CreateAlert(),

        // '/home': (context) => HomePage(),
        // '/profile': (context) => ProfilePage(),
        // '/details': (context) => detailsPage(),
        // '/alerts': (context) => detailsPage(),
      },
    );
  }
}
