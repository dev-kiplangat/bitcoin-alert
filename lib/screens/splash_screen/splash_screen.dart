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

    Future.delayed(Duration(seconds: 2), () {
      // navigate to  a new route and clear all the context
      Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Rook',
          style: TextStyle(
            color: kTextMediumColor,
            fontWeight: FontWeight.bold,
            fontSize: 33,
          ),
        ),
      ),
    );
  }
}
