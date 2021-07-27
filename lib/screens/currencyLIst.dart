import 'package:crypto_tracker/info_card.dart';
import 'package:crypto_tracker/screens/details.dart';
import 'package:flutter/material.dart';

SingleChildScrollView currencyScrollList(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: cardsArray(context),
    ),
  );
}

List<Widget> cardsArray(context) {
  late var cards = <Widget>[];

  for (var i = 0; i < currencyData.length; i++) {
    print(cards);
    cards.add(
      InfoCard(
        icon: currencyData[i]["icon"],
        price: currencyData[i]["price"],
        state: currencyData[i]["state"],
        currency: currencyData[i]["currency"],
        title: currencyData[i]["title"],
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
      ),
    );
  }

  return cards;
}

List currencyData = [
  {
    "title": "Bitcoin",
    "currency": "BTC",
    "price": "36, 928.00",
    "state": "-3",
    "icon": "BTC.svg"
  },
  {
    "title": "Etherium",
    "currency": "ETH",
    "price": "2, 928.00",
    "state": "-6",
    "icon": "ETH.svg"
  },
  {
    "title": "Cardano",
    "currency": "BTC",
    "price": "1.24",
    "state": "-3",
    "icon": "CVC.svg"
  },
  {
    "title": "Dogecoin",
    "currency": "DOGE",
    "price": "36, 928.00",
    "state": "-3",
    "icon": "DOGE.svg"
  },
  {
    "currency": "BTC",
    "price": "0.62",
    "state": "-4",
    "title": "Ripple",
    "icon": "REP.svg"
  },
];
