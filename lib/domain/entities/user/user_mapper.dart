
import 'package:nutri_glow/domain/entities/user/user.dart';

abstract class UserMapper {

  static Map<String, dynamic> toJson(User user) => 
    <String, dynamic> {
      "id": user.id,
      "login": user.login,
      "password": user.password,
    };

}