import 'package:nutri_glow/domain/entities/anthropometric_data/anthropometric_data.dart';
import 'package:nutri_glow/domain/entities/user/user.dart';
import 'package:nutri_glow/domain/entities/user/user_gateway.dart';

class MockUserGateway implements UserGateway {
  User mockUser = User(
    id: '1',
    login: 'login',
    hashedPassword:
        '\$2a\$10\$DCU6WnVZgxTK3p25EiCBve.GkhAI5a6HtZ81oe5VXG42Yu2Nhg3TC',
  );

  @override
  List<User> findAll() {
    return [];
  }

  @override
  User findOneById(String id) {
    return mockUser;
  }

  @override
  void saveAll(List<User> users) {}

  @override
  void saveOne(User user) {
    mockUser = user;
  }

  @override
  User findByLogin(String login) {
    return User(
      id: 'id',
      login: 'login',
      hashedPassword:
          '\$2a\$10\$DCU6WnVZgxTK3p25EiCBve.GkhAI5a6HtZ81oe5VXG42Yu2Nhg3TC',
    );
  }

  @override
  void changeAnthropometricDataById(String userId, AnthropometricData data) {
    final User user = findOneById(userId);

    final User userWithData = User(
      id: user.id,
      login: user.login,
      hashedPassword: user.hashedPassword,
      anthropometricData: data,
    );

    saveOne(userWithData);

  }
}
