import 'package:crypto_tracker/info_card.dart';
import 'package:crypto_tracker/screens/details.dart';
import 'package:flutter/material.dart';

SingleChildScrollView currencyScrollList(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        InfoCard(
          iconColor: Color(0xFFFF2D55),
          effectedNum: 1062,
          title: "Confirmed Cases",
          press: () {},
        ),
        InfoCard(
          iconColor: Color(0xFFFF9C00),
          effectedNum: 75,
          title: "Total Deaths",
          press: () {},
        ),
        InfoCard(
          iconColor: Color(0xFF50E3C2),
          effectedNum: 689,
          title: "Total Recovered",
          press: () {},
        ),
        InfoCard(
          iconColor: Color(0xFF5856D6),
          effectedNum: 75,
          title: "New Cases",
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DetailsScreen();
                },
              ),
            );
          },
        )
      ],
    ),
  );
}
