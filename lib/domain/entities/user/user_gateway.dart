
import 'package:nutri_glow/domain/entities/user/user.dart';

abstract class UserGateway {
  
  User? findOneById(String id);

  User? findByLogin(String login);

  List<User> findAll();

  void saveOne(User user);

  void saveAll(List<User> users); 

}