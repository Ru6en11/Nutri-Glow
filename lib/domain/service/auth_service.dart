
import 'package:nutri_glow/domain/entities/user/user.dart';

abstract class AuthService {
  
  String login();

  User signUp(String login, String password);

}