import 'package:crypto_tracker/constants.dart';
import 'package:flutter/material.dart';

AppBar buildDetailsBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Colors.transparent,
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
      "$title",
      style: TextStyle(color: kPrimaryColor, fontSize: 18),
    ),
    actions: [
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert,
            color: kPrimaryColor,
          ))
    ],
  );
}
