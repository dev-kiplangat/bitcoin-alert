import 'dart:convert';
import 'package:Rook/config/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class UserModel extends ChangeNotifier {
  final Map data = {};

  dynamic get username => data['phoneNumber'];
  dynamic get token => data['token_session'];

  void updateUsername(String name) {
    data['phoneNumber'] = name;
    notifyListeners();
  }

  void updateToken(String token) {
    data['token_session'] = "Basic $token";
    notifyListeners();
  }

  Future<int> pushUser(Map user) async {
    try {
      final url = serverUrl() + "/create-user";
      final http.Response response =
          await http.post(Uri.parse(url), headers: {}, body: user);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData['success'] == true) {
          updateUsername(responseData['phoneNumber']);
          updateToken(responseData['token']);

          return 0;
        }       
        return 2;
      }
      return 5;
    } catch (err) {
      return 10;
    }
  }
}
