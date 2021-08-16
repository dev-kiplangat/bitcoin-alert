import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

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

  Future publishAlert(Map alertInfo, String token) async {
    try {
      final http.Response response = await http.post(
          Uri.parse('http://192.168.139.75:1080/create-alert'),
          headers: {"Authorization": token},
          body: alertInfo);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data);
      }
    } catch (err) {
      print(err);
    }
  }

  Future getALerts(String token) async {
    try {
      final http.Response response = await http.get(
          Uri.parse('http://192.168.139.75:1080/fetch-alerts'),
          headers: {"Authorization": token});

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data);
      }
    } catch (err) {
      print(err);
    }
  }

  addALert(Map value) {
    data.add(value);
    notifyListeners();
  }
}
