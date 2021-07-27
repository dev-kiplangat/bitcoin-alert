import 'package:crypto_tracker/constants.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // simple usage

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
    leading: null,
    title: Text(
      "Profile",
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
