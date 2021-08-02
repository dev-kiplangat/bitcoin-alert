import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Market extends ChangeNotifier {
  late final markets;
  late bool statusLoader;

  Future fetchCurrency() async {
    try {
      statusLoader = true;
      final http.Response response = await http.get(
        Uri.parse('https://api.blockchair.com/stats'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        statusLoader = false;

        markets = data;

        return markets;
      }
    } catch (err) {
      print(err);
    }
  }
}
