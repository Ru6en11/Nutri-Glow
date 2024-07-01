
import 'package:nutri_glow/domain/entities/user/user.dart';

abstract class AuthService {
  
  String signIn(User user);

  User signUp(String login, String password);

}