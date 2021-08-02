import 'package:crypto_tracker/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeroCard extends StatelessWidget {
  const HeroCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          'assets/icons/BTC.svg',
          height: 40,
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "40, 031.09  ",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: kPrimaryColor,
                          height: 1.2,
                        ),
                  ),
                  TextSpan(
                    text: "   ^ 0.68%",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Current Stats - ",
              style: TextStyle(
                color: kTextMediumColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
