import 'package:crypto_tracker/constants.dart';
import 'package:crypto_tracker/widgets/weekly_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
  final data;

  const DetailsScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: buildDetailsBar(context),
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
                      buildCaseNumber(context),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(height: 10),
                      WeeklyChart(),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  "General Stats",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kTextMediumColor,
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
                      Text(
                        "24h Statistics",
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
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
                      Text(
                        "Mempool",
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
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

  Row buildCaseNumber(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          'assets/icons/BTC.svg',
          height: 40,
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "40, 031.09  ",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: kPrimaryColor,
                          height: 1.2,
                        ),
                  ),
                  TextSpan(
                    text: "   ^ 0.68%",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Current Stats - ",
              style: TextStyle(
                color: kTextMediumColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
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

  AppBar buildDetailsBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: kPrimaryColor,
        ),
      ),
      title: Text(
        "Bitcoin",
        style: TextStyle(color: kPrimaryColor, fontSize: 18),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: kPrimaryColor,
            ))
      ],
    );
  }
}

class IconedStats extends StatelessWidget {
  const IconedStats({
    Key? key,
  }) : super(key: key);

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
}
