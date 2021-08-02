import 'package:crypto_tracker/constants.dart';
import 'package:flutter/material.dart';

import 'components/alert_card.dart';
import 'components/app_bar.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  _AlertPage createState() => _AlertPage();
}

class _AlertPage extends State<AlertPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildDetailsBar(
        context,
        "Your Alerts",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            AlertCard(),
          ],
        ),
      ),
    );
  }
}
