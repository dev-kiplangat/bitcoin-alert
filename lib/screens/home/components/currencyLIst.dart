import 'package:crypto_tracker/config/market.dart';
import 'package:crypto_tracker/config/misc.dart';
import 'package:crypto_tracker/info_card.dart';
import 'package:crypto_tracker/screens/details/details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentCoins extends StatelessWidget {
  CurrentCoins({
    Key? key,
  }) : super(key: key);

  List<Widget> cardsArray(context, market) {
    var cards = <Widget>[];

    var data = market['data'];

    for (var currencyData in data.keys) {
      var currencyState = data[currencyData]['data'];

      if (currencyState != null) {
        cards.add(
          InfoCard(
            icon: getIcon[currencyData],
            price: currencyState['market_price_usd'].toString(),
            currency: getCurrency[currencyData],
            title: currencyData,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailsScreen(
                      title: currencyData,
                      data: currencyState,
                    );
                  },
                ),
              );
            },
          ),
        );
      }
    }

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Market>(
      builder: (context, market, child) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: cardsArray(context, market.markets),
          ),
        );
      },
    );
  }
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
