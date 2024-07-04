import 'package:bcrypt/bcrypt.dart';
import 'package:nutri_glow/domain/entities/anthropometric_data/anthropometric_data_mapper.dart';
import 'package:nutri_glow/domain/entities/user/user.dart';

abstract class UserMapper {
  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        login: json['login'],
        hashedPassword: _hashPassword(json['password']),
      );

  static Map<String, dynamic> toJson(User user) => <String, dynamic>{
        "id": user.id,
        "login": user.login,
        "password": user.hashedPassword,
        if (user.anthropometricData != null)
          "anthropometric_data": AnthropometricDataMapper.toJson(user.anthropometricData!),
      };

  static String _hashPassword(String password) {
    final String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

    return hashedPassword;
  }
}
