import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {
  final data = {"uname": "Jane Doe", "number": "0771155667"};

  dynamic get username => data['uname'];
  dynamic get number => data['uname'];

  bool updateUsername(String name) {
    data['uname'] = name;
    notifyListeners();
    return true;
  }

  bool updatePhone(String newPhone) {
    data['number'] = newPhone;
    notifyListeners();
    return true;
  }
}
