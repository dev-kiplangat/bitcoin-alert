import 'package:crypto_tracker/constants.dart';
import 'package:crypto_tracker/screens/alert/alert.dart';
import 'package:crypto_tracker/screens/alert/create_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';

class Fallback extends StatelessWidget {
  const Fallback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              "You currently have no alerts\n configured!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kTextMediumColor,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          SvgPicture.asset(
            'assets/vectors/empty_alerts.svg',
            height: 200,
          ),
          SizedBox(
            height: 80,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green[200],
              enableFeedback: true,
              padding: EdgeInsets.symmetric(
                vertical: 17,
                horizontal: 35,
              ),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateAlert(),
                ),
              );
            },
            autofocus: true,
            child: Text(
              "Create New Alert",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
