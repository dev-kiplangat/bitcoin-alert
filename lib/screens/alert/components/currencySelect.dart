import 'package:Rook/config/market.dart';
import 'package:Rook/config/misc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'info_card.dart';

class SelectCoins extends StatefulWidget {
  final Function callback;
  const SelectCoins({Key? key, required this.callback}) : super(key: key);

  @override
  _SelectCoinsState createState() => _SelectCoinsState();
}

class _SelectCoinsState extends State<SelectCoins> {
  var selectedCard = '';

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
            selected: selectedCard,
            press: () {
              setState(() {
                selectedCard = currencyData;
                widget.callback(currencyData);
              });
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
