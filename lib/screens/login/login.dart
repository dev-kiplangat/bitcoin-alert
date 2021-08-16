import 'dart:convert';

import 'package:Rook/components/constants.dart';
import 'package:Rook/config/user.dart';
import 'package:Rook/screens/login/components/login_input.dart';
import 'package:Rook/screens/otp_verify/otp_verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   bottomOpacity: .3,
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios_outlined),
      //     onPressed: () {},
      //     color: kTextMediumColor,
      //   ),
      //   title: Text(
      //     "Sign In",
      //     style: TextStyle(
      //       color: kTextMediumColor.withOpacity(.5),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                ),
                SvgPicture.asset(
                  'assets/vectors/verify.svg',
                  height: 250,
                ),
                SizedBox(
                  height: 100,
                ),
                Text(
                  "Verification",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Please Enter your phone Number\n to Continue",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kTextMediumColor,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                LoginForm(),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var phoneNumber = '';

  _update(value) {
    setState(() {
      phoneNumber = value;
    });
  }

  _submitForm(value) async {
    print('submitting ....');
    await _customSubmit(value);
  }

  _customSubmit(value) async {
    final response = await UserModel().pushUser({"phoneNumber": value});

    print(response);
    if (response == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OtpScreen()));
    } else if (response == 5) {
      print('validation issues');
    } else {
      print('Network connection problem!');
    }
  }

  Widget customTextField({
    required String hint,
    required String prefixText,
    required String label,
  }) {
    return TextFormField(
      maxLength: 12,
      onChanged: (val) {
        _update(val);
      },
      onFieldSubmitted: (val) async {
        await _submitForm(val);
      },
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: kPrimaryColor,
          ),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: kPrimaryColor,
          ),
          gapPadding: 10,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          customTextField(
            hint: "Enter Phone",
            prefixText: "+254",
            label: "phone",
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green[300],
                enableFeedback: true,
                padding: EdgeInsets.symmetric(
                  vertical: 18,
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                await _customSubmit(phoneNumber);
              },
              autofocus: true,
              child: Text(
                "Verify",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
