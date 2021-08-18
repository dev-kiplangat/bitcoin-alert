import 'package:Rook/components/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final int duration;
  const SplashScreen({Key? key, required this.duration}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5), () {
      // navigate to  a new route and clear all the context
      Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/hero.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
