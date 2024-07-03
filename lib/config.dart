
import 'dart:io';

class Config {
  static Config? _instance;

  final String _usdaKey;
  final String _jwtSecretKey;

  Config._(
    this._usdaKey,
    this._jwtSecretKey,
  );

  factory Config() {
    if (_instance != null) {
      return _instance!;
    }

    final String? usdaKey = Platform.environment["USDA_KEY"];
    final String? jwtSecretKey = Platform.environment["JWT_KEY"];

    if (usdaKey == null) throw Exception("Failed to get USDA key");
    if (jwtSecretKey == null) throw Exception("Failed to get JWT secret key");

    return Config._(usdaKey, jwtSecretKey);
  }

  String get usdaKey => _usdaKey;

  String get jwtSecretKey => _jwtSecretKey;

  
}