import 'package:crypto_tracker/constants.dart';
import 'package:flutter/material.dart';

class ChartBarText extends StatelessWidget {
  const ChartBarText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.biotech),
            SizedBox(
              width: 10,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Bitcoin\n",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  TextSpan(
                    text: "BTC",
                    style: TextStyle(
                      color: Color(0xFF7589A2),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "\$ 10, 699.58\n",
                style: Theme.of(context).textTheme.headline6,
              ),
              TextSpan(
                text: "+0.56",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
