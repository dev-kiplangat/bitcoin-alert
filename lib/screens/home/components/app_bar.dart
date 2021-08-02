import 'package:crypto_tracker/constants.dart';
import 'package:flutter/material.dart';

AppBar appbar({required String title}) {
  return AppBar(
    backgroundColor: kPrimaryColor.withOpacity(.5),
    elevation: 0,
    leading: null,
    title: Text(
      "$title",
      style: TextStyle(color: Colors.white),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.notification_add),
        onPressed: () {},
        color: Colors.teal,
      ),
    ],
  );
}
