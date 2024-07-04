import 'package:bcrypt/bcrypt.dart';
import 'package:nutri_glow/domain/entities/user/user.dart';
import 'package:nutri_glow/domain/entities/user/user_gateway.dart';
import 'package:nutri_glow/domain/interactors/signin/signin_boundary.dart';
import 'package:nutri_glow/domain/service/auth_service.dart';

class SignInInteractor implements SignInBoundary {
  final AuthService _authService;
  final UserGateway _userGateway;

  SignInInteractor({
    required AuthService authService,
    required UserGateway userGateway,
  })  : _authService = authService,
        _userGateway = userGateway;

  @override
  String execute(User user) {

    if (!_verifyUser(user)) {
      throw Exception('Invalid credentials');
    }

    final String token = _authService.signIn(user);

    return token;
  }

  // Здесь у пользователя пароль не хешированый
  // Поэтому можем сделать проверку
  // Оставил чисто для удобства, чтобы не делать много параметров для функции 
  bool _verifyUser(User _user) {
    final User? user = _userGateway.findOneById(_user.id);

    if (user == null || _verifyPassword(_user.hashedPassword, user.hashedPassword)) {
      
      return false;
    }

    return true;
  }

  bool _verifyPassword(String inputPassword, String hashedPassword) {
    return BCrypt.checkpw(inputPassword, hashedPassword);
  }
}
