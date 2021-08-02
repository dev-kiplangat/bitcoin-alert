import 'package:crypto_tracker/constants.dart';
import 'package:flutter/material.dart';

class AlertCard extends StatelessWidget {
  const AlertCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 30,
            color: Colors.black.withOpacity(.08),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 25,
      ),
      child: Column(
        children: [
          alertTinyRow(
            "Bitcoin Floody",
            "2 hours ago",
          ),
          Divider(
            height: 30,
            thickness: 1,
            color: kTextMediumColor.withOpacity(.1),
          ),
          alertTinyRow(
            "Frequency",
            "Once",
          ),
          Divider(
            height: 30,
            thickness: 1,
            color: kTextMediumColor.withOpacity(.1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              alertMainRowText(
                "Triggerred When Higher",
                "0.0216",
              ),
              alertMainRowText(
                "Current Price:",
                "0.0216 ^",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

RichText alertMainRowText(
  String subString,
  String value,
) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: "$subString\n",
          style: TextStyle(
            color: kTextMediumColor.withOpacity(.7),
          ),
        ),
        TextSpan(
          text: value,
          style: TextStyle(
            color: kTextColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
}

Row alertTinyRow(String title, String description) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
          color: kTextColor.withOpacity(.9),
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        description,
        style: TextStyle(
          color: kTextMediumColor.withOpacity(.7),
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
