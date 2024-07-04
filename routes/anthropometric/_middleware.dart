import 'package:dart_frog/dart_frog.dart';
import 'package:nutri_glow/data/gateway/mock_user_gateway.dart';
import 'package:nutri_glow/domain/entities/user/user_gateway.dart';

Handler middleware(Handler handler) {
  return handler.use(
    provider<UserGateway>(
      (_) => MockUserGateway(),
    ),
  );
}
