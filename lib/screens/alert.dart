import 'package:crypto_tracker/constants.dart';
import 'package:flutter/material.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  _AlertPage createState() => _AlertPage();
}

class _AlertPage extends State<AlertPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildDetailsBar(context),
      body: Container(),
    );
  }
}

AppBar buildDetailsBar(BuildContext context) {
  return AppBar(
    backgroundColor: kBackgroundColor,
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: kPrimaryColor,
      ),
    ),
    title: Text(
      "Your Alerts",
      style: TextStyle(color: kTextMediumColor),
    ),
    actions: [
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search_rounded,
            color: kPrimaryColor,
            size: 30,
          ))
    ],
  );
}
