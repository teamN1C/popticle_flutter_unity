import 'package:shared_preferences/shared_preferences.dart';
import 'package:popticle_flutter_unity/common/const/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

class TokenService {
  final SharedPreferences prefs;

  TokenService(this.prefs);

  Future<void> saveAccessToken(String token) async {
    await prefs.setString(ACCESS_TOKEN_KEY, token);
  }

  String? getAccessToken() {
    return prefs.getString(ACCESS_TOKEN_KEY);
  }

  Future<void> saveRefreshToken(String token) async {
    await prefs.setString(REFRESH_TOKEN_KEY, token);
  }

  String? getRefreshToken() {
    return prefs.getString(REFRESH_TOKEN_KEY);
  }

  bool hasValidToken() {
    return getAccessToken() != null;
  }
}
