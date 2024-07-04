import 'package:nutri_glow/domain/entities/anthropometric_data/anthropometric_data.dart';

class User {

  final String id;
  final String login;
  final String hashedPassword;
  final AnthropometricData? anthropometricData;

  const User({
    required this.id,
    required this.login,
    required this.hashedPassword,
    this.anthropometricData,
  });

}
