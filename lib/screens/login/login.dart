import 'package:crypto_tracker/constants.dart';
import 'package:crypto_tracker/screens/login/components/login_input.dart';
import 'package:crypto_tracker/screens/login/components/myBtn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: .3,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {},
          color: kTextMediumColor,
        ),
        title: Text(
          "Sign In",
          style: TextStyle(
            color: kTextMediumColor.withOpacity(.5),
          ),
        ),
      ),
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
                  height: 40,
                ),
                SvgPicture.asset(
                  'assets/images/login.svg',
                  height: 200,
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Enter your phone Number\n to Continue",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kTextMediumColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          hint: "Enter Phone",
          prefixText: "+254",
          label: "phone",
          onChanged: () {},
        ),
        SizedBox(
          height: 40,
        ),
        RoundedButton(
          label: "Continue",
          press: () {},
        ),
      ],
    );
  }
}
