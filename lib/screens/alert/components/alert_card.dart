import 'package:crypto_tracker/constants.dart';
import 'package:flutter/material.dart';

class AlertCard extends StatelessWidget {
  final String title;
  final String createdAt;
  final String frequency;
  final String currentPrice;
  final String watchPrice;

  const AlertCard({
    Key? key,
    required this.title,
    required this.createdAt,
    required this.frequency,
    required this.currentPrice,
    required this.watchPrice,
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
            createdAt,
          ),
          Divider(
            height: 30,
            thickness: 1,
            color: kTextMediumColor.withOpacity(.1),
          ),
          alertTinyRow(
            "Frequency",
            frequency,
          ),
          Divider(
            height: 30,
            thickness: 1,
            color: kTextMediumColor.withOpacity(.1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              alertMainRowText("Triggerred When Higher", watchPrice),
              alertMainRowText(
                "Current Price:",
                currentPrice,
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
