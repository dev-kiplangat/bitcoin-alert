import 'package:Rook/components/constants.dart';
import 'package:Rook/screens/alert/alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessCreen extends StatelessWidget {
  const SuccessCreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
          ),
          Text(
            "Congats! alert created successfully, we will update you regularly",
          ),
          SizedBox(
            height: 80,
          ),
          SvgPicture.asset(
            'assets/vectors/success.svg',
            height: 200,
          ),
          SizedBox(
            height: 80,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: kPrimaryColor,
              enableFeedback: true,
              padding: EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 35,
              ),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AlertPage(),
                  ),
                  (r) => false);
            },
            autofocus: true,
            child: Text(
              "Create Alert",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
