import 'package:Rook/components/navigator.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:Rook/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:Rook/screens/otp_verify/success.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late OTPTextEditController controller;
  final scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    OTPInteractor.getAppSignature()
        //ignore: avoid_print
        .then((value) => print('signature - $value'));
    controller = OTPTextEditController(
      codeLength: 4,
      //ignore: avoid_print
      onCodeReceive: (code) {
        print('Your Application receive code - $code');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => PageRenderer(),
            ),
            (r) => false);
      },
    )..startListenUserConsent(
        (code) {
          print(code);
          final exp = RegExp(r'(\d{4})');
          return exp.stringMatch(code ?? '') ?? '';
        },
        strategies: [],
      );
  }

// 0787399174

  // @override
  // Future<void> dispose() async {
  //   await controller.stopListen();
  //   super.dispose();
  // }

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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Success()));
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
