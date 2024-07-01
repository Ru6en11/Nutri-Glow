import 'package:nutri_glow/domain/entities/user/user.dart';
import 'package:nutri_glow/domain/entities/user/user_gateway.dart';
import 'package:nutri_glow/domain/entities/user/user_mapper.dart';
import 'package:nutri_glow/domain/interactors/signup_boundary.dart';
import 'package:nutri_glow/domain/service/auth_service.dart';

class SignUpInteractor implements SignUpBoundary{
  final UserGateway _userGateway;
  final AuthService _authSercice;

  SignUpInteractor({
    required UserGateway userGateway,
    required AuthService authService,
  })  : _userGateway = userGateway,
        _authSercice = authService;

  @override
  Map<String, dynamic> execute(String login, String password) {
    if (checkUserExistence(login)) {
      throw Exception('User already exists');
    }
    final User user = _authSercice.signUp(login, password);

    return UserMapper.toJson(user);
  }

  bool checkUserExistence(String login) {
    final User? user = _userGateway.findByLogin(login);
    if (user == null) {
      return true;
    }

    return false;
  }

}
