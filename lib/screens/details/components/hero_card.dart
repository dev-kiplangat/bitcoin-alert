import 'package:crypto_tracker/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeroCard extends StatelessWidget {
  final String icon;
  final String value;
  final String change;

  const HeroCard({
    Key? key,
    required this.icon,
    required this.value,
    required this.change,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/$icon',
          height: 40,
        ),
        SizedBox(
          width: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value + " USD         ",
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: kPrimaryColor,
                    height: 1.2,
                  ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 3,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(7, 4),
                    spreadRadius: 1,
                    color: kPrimaryColor.withOpacity(.04),
                  ),
                ],
              ),
              child: Text(
                '$change',
                style: TextStyle(
                  color: kTextMediumColor.withOpacity(.6),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
