import 'package:crypto_tracker/components/chart_bar_text.dart';
import 'package:crypto_tracker/constants.dart';
import 'package:crypto_tracker/screens/create_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  _AlertPage createState() => _AlertPage();
}

class _AlertPage extends State<AlertPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildDetailsBar(context),
      body: Container(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: alertTabNavigation(),
            body: TabBarView(
              children: customTabs(context),
            ),
          ),
        ),
      ),
    );
  }

  AppBar alertTabNavigation() {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 70,
      elevation: 0,
      leading: null,
      bottom: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 3.0,
        labelPadding: EdgeInsets.only(bottom: 15),
        tabs: [
          SvgPicture.asset(
            'assets/icons/BTC.svg',
            height: 35,
          ),
          SvgPicture.asset(
            'assets/icons/ETH.svg',
            height: 35,
          ),
          SvgPicture.asset(
            'assets/icons/DOGE.svg',
            height: 35,
          ),
        ],
      ),
    );
  }
}

Widget getSingleTab(context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Current Price",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "\$ 192, 500, 999",
                      style: TextStyle(
                        color: kTextColor.withOpacity(.7),
                        fontSize: 32,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "+ 0.3999",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 19,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          "^ 3.99%",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 19,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 30,
                color: Colors.black.withOpacity(.08),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 25,
          ),
          child: Column(
            children: [
              alertTinyRow(
                "Bitcoin Floody",
                "2 hours ago",
              ),
              Divider(
                height: 30,
                thickness: 1,
                color: kTextMediumColor.withOpacity(.1),
              ),
              alertTinyRow(
                "Frequency",
                "Once",
              ),
              Divider(
                height: 30,
                thickness: 1,
                color: kTextMediumColor.withOpacity(.1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  alertMainRowText(
                    "Triggerred When Higher",
                    "0.0216",
                  ),
                  alertMainRowText(
                    "Current Price:",
                    "0.0216 ^",
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

showModal(context) {
  return showBottomSheet(
    elevation: 30,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Container(
        height: 400,
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 4,
                  width: 50,
                  decoration: BoxDecoration(
                    color: kTextMediumColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: null,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "0.999",
                    labelText: "Enter Amount",
                  ),
                ),
              ],
            )
          ],
        ),
      );
      // Using Wrap makes the bottom sheet height the height of the content.
      // Otherwise, the height will be half the height of the screen.n
    },
  );
}

RichText alertMainRowText(
  String subString,
  String value,
) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: "$subString\n",
          style: TextStyle(
            color: kTextMediumColor.withOpacity(.7),
          ),
        ),
        TextSpan(
          text: value,
          style: TextStyle(
            color: kTextColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
}

Row alertTinyRow(String title, String description) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
          color: kTextColor.withOpacity(.9),
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        description,
        style: TextStyle(
          color: kTextMediumColor.withOpacity(.7),
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

List<Widget> customTabs(context) {
  final allCharts = <Widget>[];
  for (var i = 0; i < 3; i++) {
    allCharts.add(
      getSingleTab(context),
    );
  }
  return allCharts;
}

AppBar buildDetailsBar(BuildContext context) {
  return AppBar(
    backgroundColor: kBackgroundColor,
    elevation: 0,
    leading: null,
    title: Text(
      "Your Alerts",
      style: TextStyle(color: kTextMediumColor),
    ),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateAlert(),
            ),
          );
        },
        icon: Icon(
          Icons.add,
          color: kPrimaryColor,
          size: 30,
        ),
      ),
    ],
  );
}





  // return Wrap(
  //       children: [
  //         ListTile(
  //           title: Text(
  //             'Header',
  //             style: theme.textTheme.subtitle1!
  //                 .copyWith(color: theme.colorScheme.onPrimary),
  //           ),
  //           tileColor: theme.colorScheme.primary,
  //         ),
  //         ListTile(
  //           title: Text('Title 1'),
  //         ),
  //         ListTile(
  //           title: Text('Title 2'),
  //         ),
  //         ListTile(
  //           title: Text('Title 3'),
  //         ),
  //         ListTile(
  //           title: Text('Title 4'),
  //         ),
  //         ListTile(
  //           title: Text('Title 5'),
  //         ),
  //       ],
  //     );