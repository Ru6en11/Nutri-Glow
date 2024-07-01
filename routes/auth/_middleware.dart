import 'package:dart_frog/dart_frog.dart';
import 'package:nutri_glow/data/gateway/mock_user_gateway.dart';
import 'package:nutri_glow/data/service/mock_auth_service.dart';
import 'package:nutri_glow/domain/entities/user/user_gateway.dart';
import 'package:nutri_glow/domain/service/auth_service.dart';

Handler middleware(Handler handler) {
  // TODO Re-write with ENV
  return handler
    .use(
    provider<UserGateway>((_) => MockUserGateway())
    )
    .use(
      provider<AuthService>((_) => AuthServiceImpl(jwtSignKey: 'secret'))
    );
}
