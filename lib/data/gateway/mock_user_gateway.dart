import 'package:nutri_glow/domain/entities/user/user.dart';
import 'package:nutri_glow/domain/entities/user/user_gateway.dart';

class MockUserGateway implements UserGateway {
  @override
  List<User> findAll() {
    return [];
  }

  @override
  User findOneById(String id) {
    return User(
      id: '1',
      login: 'login',
      password: 'password',
    );
  }

  @override
  void saveAll(List<User> users) {
  }

  @override
  void saveOne(User user) {

  }
  
  @override
  User findByLogin(String login) {
    return User(id: 'id', login: 'login', password: 'password');
  }

}