import 'package:crypto_tracker/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "OtpVerify",
          style: TextStyle(
            color: kTextMediumColor,
            fontSize: 17,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              "We are sending you a short code to verify\nthat this is your phone number.",
              style: TextStyle(color: kTextMediumColor),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 60,
              vertical: 20,
            ),
            child: Form(
              child: TextFormField(
                obscureText: true,
                maxLength: 4,
                // readOnly: true,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: "Enter Code",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Did not get the message ",
                style: TextStyle(
                  color: kTextMediumColor,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                " Resend",
                style: TextStyle(
                  color: kPrimaryColor,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          OutlinedButton(
            style: ButtonStyle(
              enableFeedback: true,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Change Number",
              style: TextStyle(
                color: kPrimaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
