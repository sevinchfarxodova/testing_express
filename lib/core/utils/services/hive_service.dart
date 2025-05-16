

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HiveService {
  static const String _authBoxName = 'authBox';
  static const String _tokenKey = 'access';
  static const String _refreshTokenKey = 'refresh_token';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(_authBoxName);
  }

  static Future<void> saveToken(String token) async {
    final box = await Hive.openBox(_authBoxName);
    await box.put(_tokenKey, token);
  }

  static Future<void> saveRefreshToken(String token) async {
    final box = await Hive.openBox(_authBoxName);
    await box.put(_refreshTokenKey, token);
  }

  static Future<String?> getToken() async {
    final box = await Hive.openBox(_authBoxName);
    return box.get(_tokenKey);
  }

  static Future<String?> getRefreshToken() async {
    final box = await Hive.openBox(_authBoxName);
    return box.get(_refreshTokenKey);
  }

  static Future<void> clearTokens() async {
    final box = await Hive.openBox(_authBoxName);
    await box.delete(_tokenKey);
    await box.delete(_refreshTokenKey);
  }
}
