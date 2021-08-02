import 'package:crypto_tracker/constants.dart';
import 'package:crypto_tracker/screens/currencyLIst.dart';
import 'package:flutter/material.dart';

class CreateAlert extends StatefulWidget {
  const CreateAlert({Key? key}) : super(key: key);

  @override
  _CreateAlertState createState() => _CreateAlertState();
}

class _CreateAlertState extends State<CreateAlert> {
  String _chosenValue = 'one time';

  Widget customSelect() {
    return DropdownButton<String>(
      elevation: 20,
      focusColor: Colors.white,
      value: _chosenValue,
      //elevation: 5,
      style: TextStyle(color: Colors.white),
      iconEnabledColor: Colors.black,
      items: <String>[
        'persistent',
        'one time',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(
              color: kTextMediumColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }).toList(),

      hint: Text(
        "select frequency",
        style: TextStyle(
          color: kTextLightColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      onChanged: (value) {
        setState(() {
          _chosenValue = value.toString();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
          color: kTextMediumColor,
        ),
        title: Text(
          'Create Alert',
          style: TextStyle(
            color: kTextMediumColor,
            fontSize: 17,
          ),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                "Enter Amount",
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 80,
                right: 80,
                bottom: 20,
              ),
              child: Form(
                child: TextFormField(
                  maxLength: 16,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                    hintText: "0.00",
                    alignLabelWithHint: true,
                    enabled: true,
                    labelStyle: TextStyle(
                      textBaseline: TextBaseline.ideographic,
                    ),
                    prefixText: "\$",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Coins",
                    style: TextStyle(
                      color: kTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // coins to be here
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Alert Frequency",
                    style: TextStyle(
                      color: kTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: customSelect(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 30,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[300],
                  enableFeedback: true,
                  padding: EdgeInsets.symmetric(
                    vertical: 18,
                  ),
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                autofocus: true,
                child: Text(
                  "Create Alert",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
