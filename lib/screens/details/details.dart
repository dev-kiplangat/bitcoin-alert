import 'package:crypto_tracker/constants.dart';
import 'package:crypto_tracker/screens/details/components/icon_stats.dart';
import 'package:crypto_tracker/widgets/weekly_chart.dart';
import 'package:flutter/material.dart';
import 'components/app_bar.dart';
import 'components/hero_card.dart';

class DetailsScreen extends StatelessWidget {
  final data;
  final String title;
  final String icon;

  const DetailsScreen({
    Key? key,
    this.data,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: buildDetailsBar(context, title),
          body: Container(
            // padding: EdgeInsets.symmetric(
            //   horizontal: 15,
            //   vertical: 20,
            // ),
            decoration: BoxDecoration(
              color: Colors.red[100],
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      HeroCard(
                        icon: icon,
                        value: data['market_price_usd'].toString(),
                        change: data['market_price_usd_change_24h_percentage']
                            .toString(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(height: 10),
                      WeeklyChart(),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(4, 4),
                        blurRadius: 20,
                        color: Colors.black.withOpacity(.09),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle(
                        title: "24h Statistics",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      statsRow(
                        "Transactions",
                        data['transactions_24h'].toString(),
                      ),
                      statsRow(
                        "Blocks",
                        data['blocks_24h'].toString(),
                      ),
                      statsRow(
                        "Transactions/second",
                        data['average_transaction_fee_24h'].toString(),
                      ),
                      statsRow(
                        "Avg. time between blocks",
                        data['best_block_time'].toString(),
                      ),
                      statsRow(
                        "Median transactions fee",
                        data['median_transaction_fee_usd_24h'].toString() +
                            " USD",
                      ),
                      statsRow(
                        "Volume",
                        data['volume_24h'].toString() + " BTC",
                      ),
                      statsRow(
                        "Average transaction fee",
                        data['average_transaction_fee_usd_24h'].toString() +
                            " USD",
                      ),
                      statsRow(
                        "Hashrate",
                        data['hashrate_24h'].toString() + " Eh/s (SHA-256)",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(4, 4),
                        blurRadius: 20,
                        color: Colors.black.withOpacity(.09),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle(
                        title: "Mempool",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      statsRow(
                        "Transactions",
                        data['mempool_transactions'].toString(),
                      ),
                      statsRow(
                        "Transactions/second",
                        data['mempool_tps'].toString(),
                      ),
                      statsRow(
                        "Outputs",
                        data['mempool_outputs'].toString(),
                      ),
                      statsRow("Fees",
                          data['mempool_total_fee_usd'].toString() + " USD"),
                      statsRow("Volume", data['blockchain_size'].toString()),
                      statsRow("Size", data['mempool_size'].toString() + " MB"),
                      statsRow(
                          "Suggested transaction fee",
                          data['suggested_transaction_fee_per_byte_sat']
                                  .toString() +
                              " satoshi per second"),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                IconedStats(
                  hodlingAddresses: data['hodling_addresses'].toString(),
                  outputs: data['outputs'].toString(),
                  transactions: data['transactions'].toString(),
                  blocks: data['blocks'].toString(),
                ),
                SizedBox(height: 100),
              ],
            ),
          )),
    );
  }

  RichText buildInfoTextWithPercentage(
      {required String value, required String percentage}) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: "$percentage%\n",
          style: TextStyle(
            fontSize: 20,
            color: kPrimaryColor,
          ),
        ),
        TextSpan(
          text: "$value",
          style: TextStyle(
            color: kTextMediumColor,
            height: 1.2,
          ),
        ),
      ]),
    );
  }

  statsRow(String title, String value) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: kTextMediumColor.withOpacity(.9),
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final title;

  const SectionTitle({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: kTextMediumColor,
      ),
    );
  }
}
