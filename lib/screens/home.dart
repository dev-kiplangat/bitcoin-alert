import 'package:crypto_tracker/components/alert_btn.dart';
import 'package:crypto_tracker/components/hero_card.dart';
import 'package:crypto_tracker/components/navigator.dart';
import 'package:crypto_tracker/components/trending_coins.dart';
import 'package:crypto_tracker/config/user.dart';
import 'package:crypto_tracker/constants.dart';
import 'package:crypto_tracker/screens/currencyLIst.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor.withOpacity(.5),
        elevation: 0,
        leading: null,
        title: Text(
          "Explore",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notification_add),
            onPressed: () {},
            color: Colors.teal,
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<UserModel>(
                builder: (context, user, child) {
                  return HeroTextCard(name: user.username);
                },
              ),
              Transform.translate(
                offset: Offset(0, -80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 10, top: 20, bottom: 10, right: 10),
                      child: currencyScrollList(context),
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
      ),
    );
  }
}
