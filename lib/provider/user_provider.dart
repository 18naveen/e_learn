import 'package:e_learn/firebase/firebase_auth.dart';
import 'package:flutter/widgets.dart';

import '../models/usermodel.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final FireService _authMethods = FireService();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserData();
    _user = user;
    notifyListeners();
  }
}