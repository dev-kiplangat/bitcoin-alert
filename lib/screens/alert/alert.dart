import 'package:Rook/config/alerts.dart';
import 'package:Rook/screens/alert/components/fallback.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        child: Consumer<AlertsModel>(
          builder: (context, alert, child) {
            if (alert.data.length < 1) {
              return Fallback();
            } else
              return Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AlertCard(
                    createdAt: "2hrs ago",
                    frequency: "persistent",
                    title: "blood-boil",
                    watchPrice: "112, 256",
                    currentPrice: "100, 999",
                  ),
                ],
              );
          },
        ),
      ),
    );
  }
}
