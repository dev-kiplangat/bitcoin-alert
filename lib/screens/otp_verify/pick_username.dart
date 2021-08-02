import 'package:crypto_tracker/constants.dart';
import 'package:crypto_tracker/screens/home/home.dart';
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
          "Enter Username",
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
              "Enter your preferred username",
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
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "Enter username",
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
            height: 30,
          ),
          OutlinedButton(
            style: ButtonStyle(
              enableFeedback: true,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
            child: Text(
              "Continue",
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
