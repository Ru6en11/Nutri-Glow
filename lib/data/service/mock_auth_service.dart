import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:nutri_glow/domain/entities/user/user.dart';
import 'package:nutri_glow/domain/service/auth_service.dart';

class AuthServiceImpl implements AuthService {
  final String _jwtSignKey;

  AuthServiceImpl({required String jwtSignKey}) : _jwtSignKey = jwtSignKey;

  @override
  String signIn(User user) {
    return _generateToken(user.id);
  }

  @override
  User signUp(String login, String password) {
    return User(
      id: '1',
      login: login,
      password: password,
    );
  }

  String _generateToken(String userId) {
    final JWT jwt = JWT({'userId': userId});
    final String secret =
        jwt.sign(SecretKey(_jwtSignKey), expiresIn: Duration(seconds: 60));

    return secret;
  }

  bool _checkTokenForValidity(String token) {
    try {
      final JWT? jwt = JWT.verify(token, SecretKey(_jwtSignKey));
      if (jwt == null) return false;

      return true;
    } catch (e) {
      return false;
    }
  }
}
