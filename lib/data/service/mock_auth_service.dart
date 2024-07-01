import 'package:nutri_glow/domain/entities/user/user.dart';
import 'package:nutri_glow/domain/service/auth_service.dart';

class AuthServiceImpl implements AuthService {
  @override
  String login() {
    throw UnimplementedError();
  }

  @override
  User signUp(String login, String password) {
    return User(
      id: '1',
      login: login,
      password: password,
    );
  }
}
