import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _token != null &&
        _expiryDate.isAfter(DateTime.now())) return _token;
    return null;
  }

  Future<void> _userAuthorization(
      String email, String password, String urlSegment) async {
    final url =
        "https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyA3jsdc0PilfFadRriYKOA5jYq6JDJmJUo";

    final postResponse = await http.post(url,
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }));
    final responseBody = json.decode(postResponse.body);

    _token = responseBody['idToken'];
    _userId = responseBody['localId'];
    _expiryDate = DateTime.now().add(
      Duration(
        seconds: int.parse(responseBody['expiresIn']),
      ),
    );
    print(responseBody);
    if (responseBody['error'] != null) {
      throw HttpException(responseBody['error']['message']);
    }
    notifyListeners();
  }

  Future<void> signup(String email, String password) async {
    return _userAuthorization(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _userAuthorization(email, password, 'signInWithPassword');
  }
}
