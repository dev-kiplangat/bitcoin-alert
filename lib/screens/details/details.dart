import 'package:crypto_tracker/constants.dart';
import 'package:crypto_tracker/screens/details/components/icon_stats.dart';
import 'package:crypto_tracker/widgets/weekly_chart.dart';
import 'package:flutter/material.dart';
import 'components/app_bar.dart';
import 'components/hero_card.dart';

class DetailsScreen extends StatelessWidget {
  final data;
  final String title;

  const DetailsScreen({Key? key, this.data, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: buildDetailsBar(context, title),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ),
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(5, 4),
                        blurRadius: 13,
                        color: Colors.black.withOpacity(.05),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      HeroCard(),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(height: 10),
                      WeeklyChart(),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                SectionTitle(
                  title: "General Stats",
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
                      statsRow("Transactions", "253, 750"),
                      statsRow("Blocks", "144"),
                      statsRow("Transactions/second", "2.94"),
                      statsRow(
                          "Avg. time between blocks", "9 minutes 55 seconds"),
                      statsRow("Median transactions fee", "0.43 USD"),
                      statsRow("Volume", "3, 197, 253.750 BTC"),
                      statsRow("Average transaction fee", "2.38 USD"),
                      statsRow("Hashrate", "97.87 Eh/s (SHA-256)"),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
                      statsRow("Transactions", "253, 750"),
                      statsRow("Transactions/second", "2.94"),
                      statsRow("Outputs", "130, 879"),
                      statsRow("Fees", "6, 485.31 USD"),
                      statsRow("Volume", "3, 197, 253.750 BTC"),
                      statsRow("Size", "21.63 MB"),
                      statsRow(
                          "Suggested transaction fee", "2 satoshi per second"),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                IconedStats(),
                SizedBox(height: 100),
              ],
            ),
          )),
    );
  }

  RichText buildInfoTextWithPercentage(
      {required String title, required String percentage}) {
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
          text: "$title",
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
