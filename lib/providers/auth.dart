import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expirayDate;
  String _userId;

  Future<void> signUp(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAGU2gFIGJwjoNqnmOFSIrBVxy1Z0cKOFQ';

    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    print(json.decode(response.body));
  }
}
