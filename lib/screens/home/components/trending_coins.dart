import 'package:Rook/components/chart_bar_text.dart';
import 'package:Rook/widgets/weekly_chart.dart';
import 'package:flutter/material.dart';

class TrendingCoins extends StatelessWidget {
  const TrendingCoins({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChartBarText(),
          SizedBox(
            height: 40,
          ),
          WeeklyChart(),
        ],
      ),
    );
  }
}
