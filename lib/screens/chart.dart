import 'package:crypto_tracker/constants.dart';
import 'package:crypto_tracker/widgets/weekly_chart.dart';
import 'package:flutter/material.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildDetailsBar(context),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.03),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          scrollDirection: Axis.vertical,
          children: customCharts(context),
        ),
      ),
    );
  }
}

AppBar buildDetailsBar(BuildContext context) {
  return AppBar(
    backgroundColor: kBackgroundColor,
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
      "Trading Charts",
      style: TextStyle(color: kTextMediumColor),
    ),
    actions: [
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search_rounded,
            color: kPrimaryColor,
            size: 30,
          ))
    ],
  );
}

Widget getSingleChart(context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    margin: EdgeInsets.only(bottom: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.biotech),
                SizedBox(
                  width: 10,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Bitcoin\n",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      TextSpan(
                        text: "BTC",
                        style: TextStyle(
                          color: Color(0xFF7589A2),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "\$ 10, 699.58\n",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  TextSpan(
                    text: "+0.56",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        WeeklyChart(),
      ],
    ),
  );
}

List<Widget> customCharts(context) {
  final allCharts = <Widget>[];
  for (var i = 0; i < 10; i++) {
    allCharts.add(
      getSingleChart(context),
    );
  }
  return allCharts;
}
