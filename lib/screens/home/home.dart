import 'package:Rook/config/market.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'components/alert_btn.dart';
import 'components/app_bar.dart';
import 'components/currencyLIst.dart';
import 'components/hero_card.dart';
import 'components/trending_coins.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(title: "Explore"),
      body: Consumer<Market>(
        builder: (context, market, child) {
          if (market.loading == true)
            return FutureBuilder(
              future: market.fetchCurrency(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return homePage(context);
              },
            );
          else
            return homePage(context);
        },
      ),
    );
  }

  ListView homePage(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroTextCard(name: "Jane Doe"),
            Transform.translate(
              offset: Offset(0, -80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: 10, top: 20, bottom: 0, right: 10),
                    child: CurrentCoins(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 15, top: 0),
                    child: Text(
                      "Trending Bit Coins",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(4, 21),
                            blurRadius: 52,
                            color: Colors.black.withOpacity(.1),
                          )
                        ],
                      ),
                      child: TrendingCoins(),
                    ),
                  ),
                  CustomAlertButton()
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
