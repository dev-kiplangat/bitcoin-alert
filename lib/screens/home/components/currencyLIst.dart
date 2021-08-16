import 'package:Rook/config/market.dart';
import 'package:Rook/config/misc.dart';
import 'package:Rook/screens/details/details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'info_card.dart';

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
                      icon: getIcon[currencyData],
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
