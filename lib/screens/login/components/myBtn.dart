import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String label;
  final Function press;
  const RoundedButton({
    Key? key,
    required this.label,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(label),
      style: OutlinedButton.styleFrom(
        primary: Colors.yellow[300],
        enableFeedback: true,
        padding: EdgeInsets.symmetric(
          vertical: 18,
        ),
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: press(),
    );
  }
}
