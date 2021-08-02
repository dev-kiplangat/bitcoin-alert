import 'package:crypto_tracker/constants.dart';
import 'package:flutter/material.dart';

class IconedStats extends StatelessWidget {
  const IconedStats({
    Key? key,
  }) : super(key: key);

  Column infoIcons(String title, String value, String image) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.teal.withOpacity(.09),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Image.asset(
              'assets/images/$image',
              height: 38,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(title),
        Text(
          value,
          style: TextStyle(color: kPrimaryColor),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Wrap(
        runAlignment: WrapAlignment.spaceEvenly,
        runSpacing: 10,
        spacing: 40,
        children: [
          infoIcons("Blocks", "693, 184", "square-blocks-outline.png"),
          infoIcons("Transactions", "658, 771, 067", "arrow.png"),
          infoIcons("Outputs", "1, 790, 470, 928", "left-arrow.png"),
          infoIcons("Addresses", "38, 265, 754", "wallet.png"),
        ],
      ),
    );
  }
}
