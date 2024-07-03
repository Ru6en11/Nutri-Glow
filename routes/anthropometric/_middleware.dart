import 'package:dart_frog/dart_frog.dart';
import 'package:nutri_glow/data/gateway/mock_anthropometric_gateway.dart';
import 'package:nutri_glow/domain/entities/anthropometric_data/anthropometric_gateway.dart';

Handler middleware(Handler handler) {
  return handler.use(
    provider<AnthropometricGateway>(
      (_) => MockAnthropometricGateway(),
    ),
  );
}
