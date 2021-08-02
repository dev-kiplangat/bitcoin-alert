import 'package:crypto_tracker/constants.dart';
import 'package:crypto_tracker/screens/alert/create_alert.dart';
import 'package:flutter/material.dart';

AppBar buildDetailsBar(
  BuildContext context,
  String title,
) {
  return AppBar(
    backgroundColor: kBackgroundColor,
    elevation: 0,
    leading: null,
    title: Text(
      "$title",
      style: TextStyle(color: kTextMediumColor),
    ),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateAlert(),
            ),
          );
        },
        icon: Icon(
          Icons.add,
          color: kPrimaryColor,
          size: 30,
        ),
      ),
    ],
  );
}
