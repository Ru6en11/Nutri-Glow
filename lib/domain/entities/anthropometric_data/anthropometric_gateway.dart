
import 'package:nutri_glow/domain/entities/anthropometric_data/anthropometric_data.dart';

abstract class AnthropometricGateway {

  AnthropometricData findOneByUserId(String userId);

  void save(AnthropometricData data);

}