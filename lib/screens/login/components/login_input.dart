import 'package:crypto_tracker/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final String prefixText;
  final Function onChanged;
  const CustomTextField({
    Key? key,
    required this.label,
    required this.hint,
    required this.prefixText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        onChanged: onChanged(),
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          prefix: Text(
            "$prefixText  ",
            style: TextStyle(
              color: kTextMediumColor,
            ),
          ),
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
      ),
    );
  }
}
