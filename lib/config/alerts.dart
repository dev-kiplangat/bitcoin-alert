import 'dart:convert';

import 'package:Rook/config/utils.dart';
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
      final url = serverUrl() + "/create-alert";

      final http.Response response = await http.post(Uri.parse(url),
          headers: {"Authorization": token}, body: alertInfo);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['success'] == true) {
          return 0;
        }
        print(data);
      }
    } catch (err) {
      print(err);
    }
  }

  Future getALerts(String token) async {
    try {
      final url = serverUrl() + "/fetch-alerts";

      final http.Response response =
          await http.get(Uri.parse(url), headers: {"Authorization": token});

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
