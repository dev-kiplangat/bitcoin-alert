import 'package:flutter/cupertino.dart';

class AlertsModel extends ChangeNotifier {
  final data = <dynamic>[];

  List getAlertsOfMarket(market) {
    List marketALerts = <dynamic>[];

    data.forEach((element) {
      if (element['market'] == market) {
        marketALerts.add(element);
      }
    });

    notifyListeners();

    return marketALerts;
  }

  addALert(Map value) {
    data.add(value);
    notifyListeners();
  }
}
