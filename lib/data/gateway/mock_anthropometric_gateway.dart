import 'package:nutri_glow/domain/entities/anthropometric_data/anthropometric_data.dart';
import 'package:nutri_glow/domain/entities/anthropometric_data/anthropometric_gateway.dart';

class MockAnthropometricGateway implements AnthropometricGateway {
  @override
  AnthropometricData findOneByUserId(String userId) {
    return AnthropometricData(
      gender: Gender.male,
      age: 20,
      weight: 78,
      height: 176,
      activityLevel: ActivityLevel.active,
      goal: Goal.gain,
    );
  }

  @override
  void save(AnthropometricData data) {
    // TODO: implement save
  }
}
