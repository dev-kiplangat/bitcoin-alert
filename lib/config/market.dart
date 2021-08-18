import 'dart:convert';

import 'package:Rook/config/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Market extends ChangeNotifier {
  var markets = {};

  bool loading = true;

  void updateStatus(state) {
    loading = state;
    notifyListeners();
  }

  void updateData(state) {
    markets = state;
    notifyListeners();
  }

  Future fetchCurrency() async {
    try {
      print('called set $loading');

      final http.Response response = await http.get(
        Uri.parse('https://api.blockchair.com/stats'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data);
        updateData(data);
        updateStatus(false);

        print('finished set $loading');
      }
    } catch (err) {
      print(err);
    }
  }
}
